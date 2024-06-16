import "npm:zx/globals";
import { $ } from "npm:zx";
import { installPackage } from "../../../helpers.ts";

await installPackage({
  packageName: "tmux",
  packageManager: argv.pm,
});
const tpmDir = path.join(os.homedir(), ".tmux/plugins/tpm/");

if (fs.existsSync(tpmDir)) {
  console.log(chalk.blue("tpm already installed"));
} else {
  await spinner(
    chalk.green("installing tpm "),
    () => $`git clone https://github.com/tmux-plugins/tpm ${tpmDir}`,
  );
}

await spinner(
  chalk.green("installing tpm plugins"),
  () => $`${path.join(tpmDir, "bin/install_plugins")}`,
);
