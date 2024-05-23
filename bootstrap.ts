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
  console.log(chalk.green("tpm already installed"));
} else {
  console.log(chalk.blue("installing tpm "));
  await spinner(() =>
    $`git clone https://github.com/tmux-plugins/tpm ${tpmDir}`
  );
}

console.log(chalk.blue("installing tpm plugins"));
await spinner(() => $`${path.join(tpmDir, "bin/install_plugins")}`);
