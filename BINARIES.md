# Files published without source in this repository

These files are on the batch site as they are; they are not built from
`packages/`. Most are virtual-machine images and legacy VM runtimes
(VirtualBox, QEMU, KVM) from the early GridFactory years: large and binary,
and several of the VM runtimes carry the private SSH key used to log in to
their VM image, which does not belong in a public repository. They are
served at `https://sciencedata.dk/public/rtes/<file>`.

Check a download with `sha256sum <file>`.

| File | Size (bytes) | SHA-256 |
|---|---:|---|
| `blast-2.2.22.tar.gz` | 32810881 | `da0bd7755fdf181eefc7151fbc7e45785b91fc3db778e6c2d56621fcd4f52cab` |
| `CentOS-5-i386-Server-proof_worker.vdi.gz` | 903954067 | `95fe7b3fd089880b3f2f5854a0a01821f0a766b5edb3062ba5961c6586fe84a9` |
| `CentOS-5-i386-Server.vdi.gz` | 543188724 | `5e2bbb7bd262e966e198972488d051723315345faf21a914ea934aba8a111913` |
| `cernvm_atlas-2.1.0-x86.vdi.gz` | 285845944 | `f3b995e9e9ccceaf4a394f0f9377115f7fef4c6e742df91fed276a30a25a8624` |
| `cernvm-2.1.0-x86_64.hdd.gz` | 596923344 | `8f6fdfb586ff4ab29d32ec77e50eabefa0104534a62358f71d95dc009aef029f` |
| `cernvm-2.1.0-x86_64.hdd.gz.slow` | 583538094 | `9c121241baa40589ab058fda95216750655134aee69a1ed149e55737542b5d87` |
| `cernvm-2.1.0-x86_64.vdi.gz` | 586829441 | `345cf6a1261598f83442b735259cd4e738d926bb5e5b6037f0958f494b71ee7b` |
| `debian_sarge.img.gz` | 189655109 | `9aa6326e4112371f5624f7371958d5b97d1f65b71493be61ba6469ab168c7a04` |
| `debian_sarge.vdi.gz` | 130321061 | `49c40f7287fd585072e4f876a919e098606e706faec95d26085360171225633a` |
| `kvm_utils_linux-1.0.tar.gz` | 52846 | `3bd737bb4a6c98c7d747aa6d3f3205f013e16dc2f4e1e5cd084011d24edb8c77` |
| `kvm_utils_ubuntu-1.0.tar.gz` | 52846 | `3bd737bb4a6c98c7d747aa6d3f3205f013e16dc2f4e1e5cd084011d24edb8c77` |
| `nnpdf.tar.gz` | 228555652 | `246d1ec3d6106f989fe8da8e7b3bb25f5d1e1f7b3480431ae722515959f1a263` |
| `pdfsign-1.0.tar.gz` | 32872196 | `9790d9a897e6c800d6457393adbaaa2a0b5250975e5852aed98649a7549eda73` |
| `povray-3.6.img` | 33554432 | `0e35e2c7ce923e2c51bb164c1047373fff59412dad4fd4abaec1dfc66956e3c2` |
| `povray-3.6.tar.gz` | 7089470 | `95e5979a2661fde294cb9c036cd91bb6a619af68259cd6b5db154ee2bfd84999` |
| `pythia-6.4.25.tar.gz` | 7593978 | `473c64a2597e3df80bc7bcc4600ff8da5580349215a5e780bbc94c1b3f07268c` |
| `qemu_cernvm-1.0.1_atlas-14.2.23.tar.gz` | 380303 | `1253a93491b9d775ca68023b1cec7044f3130624fa16c39ae03c193b4268f479` |
| `qemu_cernvm-2.1.0.tar.gz` | 379769 | `630e91fe3bc69a59ba9cb1974757151891c52114bb7b4ed2f4e35ab20ee34789` |
| `qemu_debian_sarge.tar.gz` | 379734 | `cdf7cbbcd4a6d61e865a873fa2156613b32e3e46d83f35aca9aa4e5ac593df79` |
| `qemu_sl4_atlas-13.0.40.tar.gz` | 380297 | `7ed9c9459377ef166b0e5b0b94fcdbcdc1e7660807f4020b8a726b2733e558c9` |
| `qemu_utils_linux-1.0.tar.gz` | 11623435 | `e45699827bfe10b21f67fc4b2e066256cf8b23dd60398b6950446f41c2d3f9ae` |
| `qemu-0.9_sarge_windows_rte.tar.gz` | 7769405 | `528d2f674742404900f7b5a6ff678c2a4ccf89a7bfac5a615386ced513dc8b3a` |
| `qemu-0.9_sl4_rte_root.tar.gz` | 1078 | `93ffb0eef78aae3c30deef6b107c27a4f850ba59ce6efacf8db0d0e2910baaa8` |
| `qemu-0.9_sl4_rte-2GB.tar.gz` | 210886142 | `270969b6ad733c9b7abd2ee1690e51336fd76d82c34b89cd805a6be3650db6a5` |
| `qemu-0.9_sl4_rte.tar.gz` | 211102609 | `bec9cb2e495b32cdb427e2a394270cf0072f3ed994a90cb0203b95e3b6fa5725` |
| `qemu-0.9_sl4_windows_rte_admin.tar.gz` | 207243381 | `6baa3f2596281d8056183f771351c3a5e44dd9c66ca8585c7309e3a01c111730` |
| `qemu-0.9_sl4_windows_rte-2GB.tar.gz` | 207028901 | `fe73c7d7c292d4ce076104ad054b770231893584294b435c9a9ad24fdea8291b` |
| `qemu-0.9_sl4_windows_rte.tar.gz` | 207243381 | `6baa3f2596281d8056183f771351c3a5e44dd9c66ca8585c7309e3a01c111730` |
| `sl-4.iso` | 206682112 | `1433c7ad41b4d113e5d8610b5264fddcf3a759783b056e34a3931093dfdef1f6` |
| `vb_centos5_proof_worker.tar.gz` | 21340 | `5146dfa8991c7237d8ed6d47f612857f2d939b541f9526fb28ac6b989842b479` |
| `vb_centos5.tar.gz` | 21301 | `a0c6751228a21c118d38ad03d960a3e2c7c3e3f15b2a9eea103101a098561747` |
| `vb_cernvm_atlas_desktop-1.6.0-x86.tar.gz` | 20844 | `8dd98e670e4319dcb733645efc722dbe0c23c5d6c6aa5660b326ef9900c38984` |
| `vb_cernvm_atlas-2.1.0-x86.tar.gz` | 21057 | `5a27e5a23958bd6312311f9b9c6b013d1a356a70acc3295006bfc91e8187d068` |
| `vb_debian_sarge.tar.gz` | 21056 | `c0679a2f9018b94831289e54d5ea718ec7dd5d05e9b8c41b31823406dd0579e2` |
| `vb_macosx_centos5_proof_worker.tar.gz` | 21340 | `5146dfa8991c7237d8ed6d47f612857f2d939b541f9526fb28ac6b989842b479` |
| `vb_macosx_centos5.tar.gz` | 21301 | `a0c6751228a21c118d38ad03d960a3e2c7c3e3f15b2a9eea103101a098561747` |
| `vb_macosx_cernvm_atlas-2.1.0-x86.tar.gz` | 21057 | `5a27e5a23958bd6312311f9b9c6b013d1a356a70acc3295006bfc91e8187d068` |
| `vb_macosx_debian_sarge.tar.gz` | 21056 | `c0679a2f9018b94831289e54d5ea718ec7dd5d05e9b8c41b31823406dd0579e2` |
| `vb_windows_centos5_proof_worker.tar.gz` | 988996 | `4d5ea9d9fdeed0478aa8156dbd7cb12cb6e837fc0ac8ec6d913f1a7bad7d6fe1` |
| `vb_windows_centos5.tar.gz` | 988935 | `db1226578eacd9507721c2a8421cb74230c332bfaa4d2b552abf0a0c7c5a8cd2` |
| `vb_windows_cernvm_atlas-2.1.0-x86.tar.gz` | 988443 | `013b6cd987293195e80e25d1a71ae41b28ff8b92a224b812809d1d8e9d534f83` |
