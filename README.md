# Pillow's Random Scenarios

## Build 42 (unstable) readiness
- Native B42 mod options are already implemented under `Contents/mods/Pillow's Random Scenarios/42/` via `PZAPI.ModOptions` (no external ModOptions dependency). Scenarios read difficulty toggles through `PillowModOptions.getAlwaysDire()` / `getAlwaysBrutal()`.
- Core challenge flow (challenge registration, sandbox enablement, custom spawn logic, horde spawning) remains valid for B42; the B42 folder should be the authoritative path when packaging/publishing for unstable.
- Recommended follow-up for cleanliness: if B41 support is no longer needed, drop/retire the legacy `common/media` Lua that still references the old ModOptions helper so the workshop package only ships the B42 path. If B41 must remain, keep both but ensure the B42 `42/` folder stays first in the load order.

## Enhancements to existing scenarios
- **Abandoned Soldier:** Randomize extraction signals (flares/smoke) and add low-durability suppressor to emphasize stealth before the horde hits.
- **Prison Challenge:** Add rotating guard keycard spawn + louder PA alarm event after 10 minutes to force movement.
- **Fire Sale:** Sprinkle broken sprinklers/steam leaks and a delayed mall power failure (darkness + emergency lights).
- **The Final Flight:** Place an emergency beacon that occasionally attracts distant hordes; include a single-use field dressing kit for the pilot’s injuries.
- **Last Ditch Security:** Randomize which stairwell is destroyed and add a rare rooftop supply drop to encourage vertical play.
- **Entering Knox County:** Vary starting vehicle condition (battery charge/tires) and scatter highway wrecks that can explode on contact.
- **Hospital Challenge:** Add a roaming nurse zombie with morphine/keys and a chance for a locked pharmacy safe requiring time to open.
- **(Almost) Naked and Afraid:** Introduce a hidden cache (randomized between cabins) with improvised clothing and a map scrap pointing to water.
- **Dodgeball of the Dead:** Spawn sports locker loot rolls (pads/helmet) that grant minor bite/scratch mitigation to reward gym exploration.
- **The Test Subject:** Start with a malfunctioning ID wristband that occasionally opens/locks nearby lab doors; add intermittent power surges that flicker lights and draw zeds.

## New scenario concepts
- **River Refuge (houseboat start):** Begin on a moored houseboat with limited fuel and basic fishing gear. Goal: reach shore, secure a riverside cabin, and keep the boat from drifting. Needs: boat start cell, fuel drain tick, simple mooring event, light fishing supplies.
- **Broadcast Blackout (TV station):** Spawn inside a besieged TV studio mid-evacuation. Survive waves while keeping the backup generator alive to transmit a final emergency broadcast. Needs: timed wave spawns, generator health objective, studio set pieces, scripted “broadcast sent” win condition.

## AI art direction (for new scenario images)
- **Brand/style prompt:** “Project Zomboid-inspired isometric survival, gritty 8-bit/16-bit hybrid pixel art with muted Kentucky palettes, neon emergency lighting accents, VHS grain, rain-slick streets, silhouetted zombies and desperate survivors.”
- **Scenario-specific prompts:**
  - Abandoned Soldier: “Isometric pixel-art soldier alone in railyard warehouse at dusk, camo gear and ALICE pack, distant zombie silhouettes converging, neon red warning light, VHS grain.”
  - Prison Challenge: “Pixel-art prison cell at night, barred door ajar, smuggled tool glinting, hallway shadows with shambling silhouettes, cold blue emergency lights, VHS grain.”
  - Fire Sale: “Isometric mall interior erupting in fires, sprinklers failing, shopper mannequins melting, survivor with crowbar sprinting, orange glow and smoke, pixel-art, VHS grain.”
  - The Final Flight: “Crashed light aircraft in forest clearing, injured pilot with emergency kit, flickering beacon, foggy dawn, pixel-art isometric, muted greens, VHS grain.”
  - Last Ditch Security: “Dormitory second floor with missing stairs, improvised barricades, zombies pounding below, survivor holding pistol, red emergency lights, pixel-art isometric, VHS grain.”
  - Entering Knox County: “Beat-up sedan on cracked highway entering quarantined town, low fuel gauge, roadblocks and wrecks, looming zombie shapes, rainy dusk, pixel-art isometric, VHS grain.”
  - Hospital Challenge: “Hospital ward in disarray, patient in gown limping, IV stand toppled, emergency lights flashing, zombies through double doors, pixel-art isometric, VHS grain.”
  - (Almost) Naked and Afraid: “Cabin interior at night, terrified survivor in makeshift wraps, lantern glow, boarded windows, shadows of zombies outside, pixel-art isometric, VHS grain.”
  - Dodgeball of the Dead: “High-school gym, dodgeballs scattered, concussed player gripping bat, zombies bursting through bleachers, harsh gym lights, pixel-art isometric, VHS grain.”
  - The Test Subject: “Underground lab corridor, flickering lights, subject with malfunctioning wristband, containment doors sparking, hordes pressing on glass, pixel-art isometric, neon accents, VHS grain.”

## Notes on testing
No automated tests or lint scripts are present in the repo; manual verification is required in-game. Use B42’s `42/` folder as the active path when packaging or local testing.
