# GridFactory runtime environments for ScienceData

Sources of the software catalog, the runtime-environment (RTE) packages and
the user groups (virtual organizations) that the ScienceData batch service
publishes at <https://sciencedata.dk/sites/batch/>. Any GridFactory batch
server can use them, not only ScienceData's.

## How a batch server uses them

A GridFactory server reads the catalog named in `/etc/gridfactory.conf`:

    RTE_URLS = https://sciencedata.dk/sites/batch/rtes/rtes.xml

A job asks for a runtime environment with a directive such as

    #GRIDFACTORY -r UTIL/WhisperUtil

The server looks the name up in the catalog, downloads the package from the
URL listed there into its own cache the first time a job needs it, and a
worker that picks up the job installs it: it unpacks the tarball, runs
`control/install` and, for each job, sources `control/runtime` (which, for
example, puts the package's `bin/` on `PATH`). A catalog entry can instead be
a plain check (`<command>`) for software that is part of the worker image,
such as `UTIL/Whisper`.

## Layout

| Path | Published as |
|---|---|
| `catalog/rtes.xml`, `catalog/rtes.xsl` | `https://sciencedata.dk/sites/batch/rtes/rtes.xml` (also `…/public/rtes/`) |
| `packages/<name>/` | `https://sciencedata.dk/public/rtes/<name>.tar.gz` |
| `vos/<group>.txt` | `https://sciencedata.dk/sites/batch/vos/<group>.txt` |
| `site/` | the pages of `https://sciencedata.dk/sites/batch/` |
| `assets/` | `https://sciencedata.dk/public/rtes/<file>` (e.g. the stamp used by the `sign_pdf` job template) |
| `BINARIES.md` | files published without source here (VM images, large packages), with checksums |

A package directory holds `control/` (`install`, `remove`, `runtime`) and
`data/` (what gets installed). A VO file lists one certificate subject per
line, or `anyone`.

## Changing a package or the catalog

1. Edit `packages/<name>/` (or add a new package and its entry in
   `catalog/rtes.xml`), and commit.
2. Build: `scripts/build.sh <name>` writes `dist/<name>.tar.gz`.
3. Publish: `SITE_USER=… SITE_PASSWORD=… scripts/publish.sh dist/<name>.tar.gz`
   (or `catalog/rtes.xml`, `vos/<group>.txt`, `site/…`).

`publish.sh` uploads to every service that hosts the site and then checks that
each one serves exactly the local bytes. Until the old ScienceData service is
retired, that is both the old service and the new one; their public URLs are
the same. After the switch, remove the old entry from `TARGETS` in the script.

Batch servers and workers cache packages they have downloaded or installed
(see `RTE_CACHE_SECONDS` in `gridfactory.conf`), so a change under an
unchanged name may only reach them when the cache expires. For a change that
must take effect at once, publish it under a new version and catalog entry.

## Notes

- Public URLs name only `sciencedata.dk`, never a particular server, so
  nothing changes for batch servers or job scripts when the service moves.
- The published `rtes` folder also holds unpacked copies of some packages
  (e.g. `atlas-15.6.1/`, `nnpdf/`) left from earlier work; GridFactory only
  uses the tarballs.
