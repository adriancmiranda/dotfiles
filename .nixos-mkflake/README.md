# NixOS

> Como instalar

## Baixe Gnome / minimal ISO image

- https://nixos.org/download.html

## Salve em um pendrive 

- https://www.balena.io/etcher/

## Entre na BIOS

- Reinicie o computador e fique pressionando f12

## Use sempre as permissões de root

```sh
sudo su
```

ou 

```sh
sudo -i
```

## Verifique

> Veja as informações sobre as partições do HD e outros dispositivos de armazenamento como pen drives e CDs em formato de árvore com:

```sh
lsblk
```

mais em: https://guialinux.uniriotec.br/lsblk/

## Particione seu HD

```sh
fdisk /dev/<nome do HD que você quer particionar (exibido em lsblk)>
```

Você precisará de uma partição para swap de 200MB à +8G (provavelmente não mais que isso), e, uma partição 
padrão com todo o resto (se você não quiser fazer mais partições para, sei lá, um dual boot ou algo assim)

```sh
d # para deletar a partição de swap
<enter>
d # para deletar a partição principal
<enter>
g # para criar uma partição vazia em GPT
<enter>
n # para criar uma nova partição de swap
<enter>
<enter>
+200MB # or +2G or yet +8G
<enter>
t # para definir o tipo da partição recém criada
<enter>
L # para ver as partições em geral
1 # para escolher EFI partition
<enter>
n # para criar uma nova partição 
<enter>
<enter>
<enter>
w # para salvar e sair
```

## Verifique as partições

```sh
lsblk
```

## Formate as partições

### swap

```sh
mkfs.fat -F 32 -n NIXBOOT /dev/<nome da partição de swap>
```
> Note: caso queira mudar o rótulo do hd, não queira `NIXBOOT`

```sh
fatlabel /dev/<nome da partição de swap> <outro nome>
```

### root

```sh
mkfs.ext4 /dev/<nome da partição> -L NIXROOT
```

# Monte o disco

### root

```sh
mount /dev/disk/by-label/NIXROOT /mnt
```

### swap

```sh
mkdir -p /mnt/boot && mount /dev/disk/by-label/NIXBOOT /mnt/boot/ && ls /mnt
```
> boot lost + found

## `Encripte` os discos

```sh
dd if=/dev/zero of=/mnt/.swapfile bs=1024 count=2097152
```

```sh
chmod 600 /mnt/.swapfile
```

```sh
mkswap /mnt/.swapfile
```

```sh
swapon /mnt/.swapfile
```


## Gere as configurações

```sh
nixos-generate-config --root /mnt
```

```sh
cd /mnt/etc/nixos
```

edite

```sh
vim configuration.nix
```

edite

```sh
hardware-configuration.nix
```

volte para a raiz

```sh
cd /mnt
```

instale

```sh
nixos-install
```

ponha a senha que você definiu no configuration.nix

reinicie o computador

ponha a senha novamente

abra o terminal

digite (para redefinir a senha)

```sh
passwd
```

instale o `nix home-manager` e copie o arquivo `home.nix`
para o diretório .config/nixpkgs/

configure a gosto

[youtube-tutorial]: https://www.youtube.com/watch?v=axOxLJ4BWmY