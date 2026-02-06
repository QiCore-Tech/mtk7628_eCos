# mtk7628_eCos

This project provides an embedded firmware development environment for the **MediaTek MT7628** SoC, based on the **eCos (Embedded Configurable Operating System)**. It is specifically tailored for building high-performance router and access point (AP) firmware.

## Project Overview

The `mtk7628_eCos` environment integrates the eCos kernel with hardware-specific drivers and an application layer containing common networking services. The project supports **Little-Endian MIPS** (`elf32-littlemips`) to align with MT7628 hardware requirements.

### Key Components

*   **eCos Repository (`/packages`)**: Standard and customized eCos source packages.
*   **Application Layer (`/ra305x_ap_adv`)**: Router logic, CLI, web management interface, and networking services (DHCP, DNS, PPPoE, etc.).
*   **Drivers (`/ra305x_drivers`)**: MT7628 hardware drivers, including Ethernet (`eth_ra305x`) and Wireless (Jedi_7628).
*   **Wireless Driver Source (`/mt7628-p4rev-120395`)**: Integrated source code for the MT7628 wireless driver.
*   **Toolchain (`/tools`)**: Pre-configured `mipsisa32-elf` cross-compiler.

## Getting Started

### Prerequisites

The build environment requires a Linux-based system with standard build tools (`make`, `gcc`, `tar`, etc.). The specific MIPS toolchain is provided within the project.

### Build Instructions

The simplest way to build the firmware is using the provided automation script:

```bash
./build_ecos.sh
```

Alternatively, you can use the `Makefile` directly:

1.  **Extract Toolchain**:
    ```bash
    tar -zxvf tools/mipsisa32-elf.tgz -C tools/
    ```

2.  **Build Everything**:
    ```bash
    make
    ```

### Output Artifacts

Compiled images and binaries are generated in the project root or within `ra305x_ap_adv/ra305x_router/`.
*   `eCos_ap_router.img`: The main firmware image.
*   `zxrouter.img`: Compressed/packaged router image.

## Directory Structure

*   `ra305x_ap_adv/ra305x_router`: Main application and configuration directory.
*   `ra305x_ap_adv/ra305x_bsp`: Board Support Package and eCos kernel configuration.
*   `ra305x_drivers`: MT7628 specific hardware drivers.
*   `mt7628-p4rev-120395`: Wireless driver source code (managed directly).
*   `packages`: eCos source tree.
*   `tools`: Cross-compilation toolchain and utilities.

## Recent Changes

*   **Little-Endian Transition**: The entire project architecture has been updated to Little-Endian (LE) to support MT7628 hardware natively.
*   **Integrated Driver Source**: Converted `mt7628-p4rev-120395` from a submodule to direct file management for easier maintenance.
*   **Configuration Fixes**: Updated port masks and boot scripts for better hardware compatibility.
*   **Firmware Updates**: Integrated updated Jedi_7628 wireless firmware binaries.

---
*Developed for MediaTek MT7628 SoC based on eCos RTOS.*