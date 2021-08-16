import { KnitServer as Knit, Component, Janitor } from "@rbxts/knit";

// Create Component:
class NewComponent implements Component.ComponentClass {
	public static Tag = "Component";
	private janitor = new Janitor();

	// Constructor:
	constructor(Object: Instance) {}

	public Init() {}

	public Destroy() {
		this.janitor.Destroy();
	}
}

// Export:
export = NewComponent;
