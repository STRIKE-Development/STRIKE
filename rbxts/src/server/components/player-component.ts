import { Players } from "@rbxts/services";
import ProfileService from "@rbxts/profileservice";
import { ProfileType, Template } from "shared/data/datastore";

import { OnStart } from "@flamework/core";
import { Component, BaseComponent } from "@flamework/components";
import { Profile } from "@rbxts/profileservice/globals";

// Constants:
const ProfileStore = ProfileService.GetProfileStore("Player", Template);

async function LoadProfile(Player: Player) {
	const Profile = ProfileStore.LoadProfileAsync("Player: " + Player.UserId);
	if (Profile) {
		Profile.AddUserId(Player.UserId);
		Profile.Reconcile();
		Profile.ListenToRelease(() => {
			Player.Kick();
		});

		if (Players.IsAncestorOf(Player)) {
			return Profile;
		} else {
			Profile.Release();
			throw "Player left before profile loaded.";
		}
	} else {
		Player.Kick();
		throw "Profile failed to load.";
	}
}

// Component:
@Component({
	tag: "Player",
})
export class PlayerComponent extends BaseComponent<{}, Player> implements OnStart {
	public Profile!: Profile<ProfileType>;

	FetchCache(): ProfileType {
		return this.Profile.Data;
	}

	OverrideCache(Value: ProfileType) {
		this.Profile.Data = Value;
	}

	UpdateCache(cb: (Cache: ProfileType) => ProfileType) {
		this.OverrideCache(cb(this.FetchCache()));
	}

	onStart() {
		const Player = this.instance;
		LoadProfile(Player)
			.andThen((Profile) => {
				this.Profile = Profile;
			})
			.catch((Exception) => {
				warn(`[Component ${Player.DisplayName}]: ${Exception}`);
			});
	}
}
