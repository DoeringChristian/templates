from omegaconf import OmegaConf, DictConfig
from datetime import datetime
from pathlib import Path
import os

now = datetime.now()
now = now.strftime("%Y%m%d-%H%M%S")


def experiment(cfg: DictConfig):
    cfg_yaml = OmegaConf.to_yaml(cfg, resolve=True)
    print(cfg_yaml)
    os.makedirs(f"{cfg.outdir}/", exist_ok=True)
    OmegaConf.save(cfg, f"{cfg.outdir}/config.yaml", resolve=True)

    ...


def run(params: dict):
    cfg = OmegaConf.load(f"cfg/{Path(__file__).stem}.yaml")
    cfg.update(params.items())
    cfg.update([("date", f"{now}"), ("experiment", Path(__file__).stem)])

    for k, v in params.items():
        if k == "params":
            continue
        cfg.params = f"{cfg.params} {k}={v}"

    return experiment(cfg)


if __name__ == "__main__":
    run({})
