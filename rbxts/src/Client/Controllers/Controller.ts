// Load Knit:
import { KnitClient as Knit } from "@rbxts/knit";

// Create Controller:
const Controller = Knit.CreateController({
	Name: "Controller",

	// Properties:
	Property: "",

	// Methods:
	Method() {},

	// Controller Built-ins:
	KnitInit() {},
	KnitStart() {},
});

// Export:
export = Controller;
declare global {
	interface KnitControllers {
		Controller: typeof Controller;
	}
}
