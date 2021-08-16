// Client Runtime (0.0.20-alpha)
// Written by OminousVibes#7259
// 8/13/21

import { ReplicatedStorage, RunService } from "@rbxts/services";
import { KnitClient as Knit, Component } from "@rbxts/knit";
import Globals from "Shared/Globals";

// Fetch Folders:
const Root = script.Parent;
const Controllers = Root!.WaitForChild("Controllers", 45) as Folder;
const Components = Root!.WaitForChild("Components", 45) as Folder;
const Modules = Root!.WaitForChild("Modules", 45) as Folder;

assert(Controllers && Components && Modules, "[Knit Client]: Required Knit Dependencies may be missing!");

// Populate Globals:
Globals.Modules = Modules;

// Add Controllers & Components:
Knit.AddControllersDeep(Controllers);
Component.Auto(Components);

// Start Knit:
Knit.Start()
	.then(function () {
		if (RunService.IsStudio()) {
			print("[Knit Client]: Initialized!");
		}
	})
	.catch(function (Exception: string) {
		warn(`[Knit Client]: ${Exception}`);
	})
	.await();
