// Server Runtime (0.0.20-alpha)
// Written by OminousVibes#7259
// 8/13/21

import { Players, RunService, CollectionService } from "@rbxts/services";
import { KnitServer as Knit, Component } from "@rbxts/knit";
import Globals from "Shared/Globals";

// Fetch Folders:
const Root = script.Parent;
const Services = Root!.WaitForChild("Services", 45) as Folder;
const Components = Root!.WaitForChild("Components", 45) as Folder;
const Modules = Root!.WaitForChild("Modules", 45) as Folder;

assert(Services && Components && Modules, "[Knit Server]: Required Knit Dependencies may be missing!");

// Populate Globals:
Globals.Modules = Modules;

// Add Services & Components:
Knit.AddServicesDeep(Services);
Component.Auto(Components);

// Start Knit:
Knit.Start()
	.then(function () {
		if (RunService.IsStudio()) {
			print("[Knit Server]: Initialized!");
		}
	})
	.catch(function (Exception: string) {
		warn(`[Knit Server]: ${Exception}`);
	})
	.await();
