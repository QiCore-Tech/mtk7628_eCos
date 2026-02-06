# GEMINI.md - Project Context: mtk7628_eCos

This file provides context and instructions for AI agents working on the `mtk7628_eCos` project.

## Project Overview

The `mtk7628_eCos` project is an embedded firmware development environment for the **MediaTek MT7628** chipset, based on the **eCos (Embedded Configurable Operating System)**. It is designed for building router and access point (AP) firmware.

### Key Components

- **eCos Repository (`/packages`)**: Contains the standard and customized eCos source packages.
- **Application Layer (`/ra305x_ap_adv`)**: Contains the router application logic, CLI, web interface, and networking services (DHCP, DNS, PPPoE, etc.).
- **Drivers (`/ra305x_drivers`)**: Hardware-specific drivers for the MT7628, including Ethernet (`eth_ra305x`) and Wireless (Jedi_7628).
- **Toolchain (`/tools`)**: Contains the `mipsisa32-elf` cross-compiler toolchain (compressed as `mipsisa32-elf.tgz`).

## Building and Running

The project uses a standard Makefile-based build system, often wrapped by helper scripts.

### Environment Setup

The build process requires several environment variables to be set, which are typically handled by the root `Makefile` or `build_ecos.sh`:
- `ECOS_REPOSITORY`: Path to the `packages` directory.
- `ECOS_MIPSTOOL_PATH`: Path to the cross-compiler binaries.

### Build Commands

- **Build Everything**:
  ```bash
  make
  ```
  This command extracts the toolchain if necessary, builds the eCos kernel, and then builds the application modules.

- **Build Kernel Only**:
  ```bash
  make kernel
  ```

- **Build Modules Only**:
  ```bash
  make module
  ```

- **Clean**:
  ```bash
  make clean
  ```

- **Configuration (Menuconfig)**:
  ```bash
  make menuconfig
  ```
  Note: This usually runs a configuration utility within the `ra305x_ap_adv/ra305x_router` directory.

- **Automated Build Script**:
  ```bash
  ./build_ecos.sh
  ```
  This script is a wrapper that performs toolchain extraction, environment setup, and builds both kernel and module targets.

### Output Artifacts

- Compiled images are typically generated as `.img`, `.bin`, or `.gz` files.
- Common output names: `eCos_ap_router.img`, `zxrouter.img`.
- Artifacts are often found in the project root or within `ra305x_ap_adv/ra305x_router`.

## Development Conventions

- **Toolchain**: Always use the provided `mipsisa32-elf` toolchain located in `tools/`.
- **eCos Configuration**: System-wide configuration is handled via `.ecc` files or CDL (Component Definition Language) files within the `packages` and `ra305x_bsp` directories.
- **Header Files**: Global configuration is often defined in `config.h` or `autoconf.h` within the router application directory.
- **Coding Style**: The project follows C conventions suitable for embedded systems (minimize dynamic memory allocation, use fixed-size types where possible).
- **Drivers**: New hardware support should be added under `ra305x_drivers`.

## Key Files for Investigation

- `Makefile`: Root build instructions and environment defaults.
- `build_ecos.sh`: Primary automation script for CI/CD or local setup.
- `ra305x_ap_adv/ra305x_router/Makefile`: Main application-level Makefile.
- `packages/ecos.db`: eCos package database definition.
- `ra305x_ap_adv/ra305x_router/.config`: Current firmware configuration.
