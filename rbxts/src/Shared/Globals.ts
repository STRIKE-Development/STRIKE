import { ReplicatedStorage } from "@rbxts/services";

const Globals: { [Key: string]: Instance | undefined } = {
	Modules: undefined,
	Shared: ReplicatedStorage!.FindFirstChild("Shared"),
	Assets: ReplicatedStorage!.FindFirstChild("Assets"),
};

export = Globals;
