import "npm:zx/globals";
import { $ } from "npm:zx";
import { hasHomebrew, maybeInstallPackage } from "../../../helpers.ts";

const hasBrew = await hasHomebrew();
if (!hasBrew) {
  await $`exit`;
}

await maybeInstallPackage("tmux");
const tpmDir = path.join(os.homedir(), ".config/tmux/plugins/tpm/");

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
