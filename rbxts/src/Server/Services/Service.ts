// Load Knit:
import { KnitServer as Knit } from "@rbxts/knit";

// Create Service:
const Service = Knit.CreateService({
	Name: "Service",
	Client: {},

	// Properties:
	Property: "",

	// Methods:
	Method() {},

	// Controller Built-ins:
	KnitInit() {},
	KnitStart() {},
});

// Export:
export = Service;
declare global {
	interface KnitServices {
		Service: typeof Service;
	}
}
