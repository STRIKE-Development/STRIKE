import { OnStart } from "@flamework/core";
import { Component, BaseComponent } from "@flamework/components";

@Component()
export class MyComponent extends BaseComponent implements OnStart {
	constructor() {
		super();
	}

	onStart() {
		print(`Wow! I'm attached to ${this.instance.GetFullName()}`);
	}
}
