import { Service, OnTick, Dependency } from "@flamework/core";

@Service()
export class Datastore implements OnTick {
	onTick(dt: number) {
		print("My service is ticking", dt);
	}
}
