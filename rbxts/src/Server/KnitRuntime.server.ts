// Server Runtime (0.0.18-alpha)
// Written by OminousVibes#7259
// 8/13/21

import { Players, ReplicatedStorage, RunService, CollectionService } from "@rbxts/services";
import { KnitServer as Knit, Component } from "@rbxts/knit";
import Globals from "Shared/Globals";

// Fetch Folders:
const Root = script.Parent;
const Components = Root?.FindFirstChild("Components");
const Services = Root?.FindFirstChild("Services");
const Modules = Root?.FindFirstChild("Modules");

assert(Components, "[Knit Server]: Components may have gone missing.");
assert(Services, "[Knit Server]: Services may have gone missing.");
assert(Modules, "[Knit Server]: Modules may have gone missing.");

// Populate Globals:
Globals.Modules = Modules;

// Add controllers & components:
Knit.AddServicesDeep(Services);
Component.Auto(Components);

// Start Knit:
Knit.Start()
	.then(function () {
		if (RunService.IsStudio()) {
			print("[Knit Server]: Initialized!");
		}
		for (const Player of Players.GetChildren()) {
			CollectionService.AddTag(Player, "Player");
		}
		Players.PlayerAdded.Connect((Player: Player) => CollectionService.AddTag(Player, "Player"));
	})
	.catch(function (Exception: string) {
		warn(`[Knit Server]: ${Exception}`);
	})
	.await();
