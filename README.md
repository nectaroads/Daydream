# Wonderland Online: Daydream

**Wonderland Online: Daydream** is a fan-made take on *Wonderland Online*, built on a custom Godot 4.7 client with a native C++ module. It preserves the classic 2D isometric look, quests, and turn-based battles while modernizing the engine underneath so the game starts quickly, runs smoothly, and stays light enough to run multiple windows side by side.

## What You Can Do in Daydream

- **Turn-Based Combat & Companions** — Fight solo or in a party, recruit and train companions, manage their skills and passive loadouts, and customize character and companion appearances with dedicated vanity and visibility slots.
- **Quests, Cutscenes & Exploration** — Play through story quests and cutscenes, unlock field skills, and travel across islands, towns, and dungeons on foot or with mounted vehicles.
- **Crafting, Alchemy & Tent Housing** — Gather materials, compound and manufacture gear, and build out your personal tent into a portable home and workshop.
- **Gathering & Life Skills** — Step off the beaten path to forage, use field tools, or spend an evening fishing.
- **Parties, Trading & Guilds** — Team up with friends, trade items safely, send mail, use balloon and body emotes, and design a custom `24x24` pixel-art guild insignia right inside the guild panel.

## Visual & Technical Design

Daydream pairs a native C++ asset decoder and world renderer with Godot 4.7 (GL Compatibility). Classic artwork is decoded directly from the original archives and drawn pixel-accurate at `800x600`, while optional client-side layers let you tune how nostalgic or atmospheric you want the world to feel:

- **Graphics Presets** — Switch between **Classic (Light)** for minimal overhead, **Balanced**, **Daydream Visual** for full atmosphere, or **Custom** to toggle day/night lighting, clouds, dynamic weather (rain, puddles, snowfall), actor shadows, and water reflections individually.
- **Screen Filters** — Optional post-processing filters including CRT, ordered dithering, xBR upscaling (`2x`–`4x`), Painting, Cottage, Monochrome, and PSX.
- **Built for Multi-Client Play** — Automatic background FPS throttling (`20 FPS` when unfocused), an adjustable FPS cap, and configurable RAM cache budgets keep multiple simultaneous clients responsive and frugal.

## Pick a Realm

| Realm | Who it's for | How to join |
| --- | --- | --- |
| **Wonderland** | Live realm for regular play on the stable build. | View the `main` branch, keep **Beta: Off**, press **Start**, and choose **Wonderland**. |
| **Miracle** | Public beta realm where new updates land first. Characters and progress are separate from Wonderland. | View the `Beta` branch, turn **Beta: On**, press **Start**, and choose **Miracle**. |
| **Journey** | Local development realm that connects to a server on your own machine (`127.0.0.1`). | Start your local Daydream server, then choose **Journey** in the realm list. |

## Download and Play

View this README on the branch matching your realm (`main` for **Wonderland**, `Beta` for **Miracle**) so the download links point to the right build. Drop the file into a writable folder of its own — something like `Daydream/` works cleanly.

| System | Download | How to launch |
| --- | --- | --- |
| Windows (64-bit) | [Daydream.exe](Daydream.exe?raw=true) | Double-click `Daydream.exe`. |
| Linux (x86_64) | [Daydream](Daydream?raw=true) | Mark it executable in your file manager, or run `chmod +x Daydream && ./Daydream`. |
| macOS (Universal: Apple Silicon & Intel) | [Daydream-macOS.zip](Daydream-macOS.zip?raw=true) | Unzip the archive and open the `.app` inside. |

You only need that one download. On your first **Start**, the launcher downloads and verifies the game data archives into your folder and opens the realm list when finished. Because the full dataset is several gigabytes, give that initial setup a few minutes to complete.

## Updates & Folder Layout

- **Incremental Updates on Start** — Pressing **Start** checks your selected branch (`main` or `Beta`) and downloads only missing or changed files, reusing verified files already on disk.
- **Full Verification with Update** — If anything looks out of sync or damaged, **Update** re-verifies your installation and repairs what is missing or corrupted.
- **Clean Channel Separation** — **Wonderland** keeps its assets beside the executable, while **Miracle** stores beta data in a `beta/` subfolder. Switching channels updates and swaps the executable in place, cleaning up old runtime copies on restart.
- **Portable Diagnostics** — Performance reports and crash traces (`map-load-latest.json`) are saved next to the executable (or beside the `.app` bundle on macOS).

## Found a Bug?

If something breaks or behaves strangely, [open an issue](https://github.com/nectaroads/Daydream/issues/new) with:
- Your operating system (`Windows`, `Linux`, or `macOS`)
- The realm you were on (`Wonderland`, `Miracle`, or `Journey`)
- What you were doing when it happened, plus screenshots or error/log output if available
