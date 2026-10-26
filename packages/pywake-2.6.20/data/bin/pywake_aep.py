"""Annual energy production (AEP) of a wind farm layout with PyWake.

Usage: python pywake_aep.py layout.csv report.txt wakemap.png
layout.csv: one turbine per line, "x,y" in metres (a header line is allowed).
Site and turbine: PyWake's Horns Rev 1 example (offshore, Vestas V80 2 MW);
wake model: Bastankhah & Porte-Agel (2014).
"""
import sys
import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from py_wake.examples.data.hornsrev1 import Hornsrev1Site, V80
from py_wake.literature.gaussian_models import Bastankhah_PorteAgel_2014
from py_wake import HorizontalGrid

layout, report, wakemap = sys.argv[1], sys.argv[2], sys.argv[3]
xy = np.genfromtxt(layout, delimiter=",", dtype=float, invalid_raise=False)
xy = np.atleast_2d(xy)
xy = xy[~np.isnan(xy).any(axis=1)][:, :2] if xy.size else np.empty((0, 2))
if len(xy) == 0:
    sys.exit("No turbine positions found in " + layout + " (expected lines 'x,y' in metres).")
x, y = xy[:, 0], xy[:, 1]

site, turbine = Hornsrev1Site(), V80()
# k = 0.0324555: PyWake's default wake expansion for this model (as in its own examples)
farm = Bastankhah_PorteAgel_2014(site, turbine, k=0.0324555)
sim = farm(x, y)
aep = float(sim.aep().sum())                          # GWh
aep_nowake = float(sim.aep(with_wake_loss=False).sum())
per_turbine = sim.aep().sum(["wd", "ws"]).values

with open(report, "w") as f:
    f.write("Wind farm AEP with PyWake (Horns Rev 1 site, Vestas V80, Bastankhah & Porte-Agel 2014 wake model)\n")
    f.write(f"Turbines: {len(x)}\n")
    f.write(f"AEP: {aep:.2f} GWh/year\n")
    f.write(f"AEP without wakes: {aep_nowake:.2f} GWh/year\n")
    f.write(f"Wake loss: {100 * (1 - aep / aep_nowake):.2f} %\n\n")
    f.write("turbine,x,y,aep_gwh\n")
    for i, (xi, yi, a) in enumerate(zip(x, y, per_turbine)):
        f.write(f"{i + 1},{xi:.1f},{yi:.1f},{a:.3f}\n")

# Wake map for wind from the west at 10 m/s, on a grid reaching 3 km downwind.
grid = HorizontalGrid(x=np.linspace(x.min() - 1000, x.max() + 3000, 300),
                      y=np.linspace(y.min() - 1000, y.max() + 1000, 200))
plt.figure(figsize=(10, 6))
sim.flow_map(grid=grid, wd=270, ws=10).plot_wake_map()
plt.xlabel("x [m]")
plt.ylabel("y [m]")
plt.gca().set_aspect("equal")
plt.title(f"Wake map, wind from 270° at 10 m/s - AEP {aep:.1f} GWh/year, wake loss {100 * (1 - aep / aep_nowake):.1f} %")
plt.savefig(wakemap, dpi=120, bbox_inches="tight")
