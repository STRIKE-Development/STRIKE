import { Service } from "@flamework/core";

@Service()
export class MatchMaking {
	onTick(dt: number) {
		print("My service is ticking", dt);
	}
}
