// Server Runtime (0.0.20-alpha)
// Written by OminousVibes#7259
// 7/20/21

import { ReplicatedStorage, RunService } from "@rbxts/services";
import { KnitClient as Knit, Component } from "@rbxts/knit";
import Globals from "Shared/Globals";

// Fetch Folders:
const Root = script.Parent;
const Components = Root?.FindFirstChild("Components");
const Controllers = Root?.FindFirstChild("Controllers");
const Modules = Root?.FindFirstChild("Modules");

assert(Components, "[Knit Client]: Components may have gone missing.");
assert(Controllers, "[Knit Client]: Controllers may have gone missing.");
assert(Modules, "[Knit Client]: Modules may have gone missing.");

// Populate Globals:
Globals.Modules = Modules;
Globals.Shared = ReplicatedStorage!.FindFirstChild("Shared");
Globals.Assets = ReplicatedStorage!.FindFirstChild("Assets");

// Add controllers & components:
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
