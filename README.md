
# OceanNet App

  

Flutter Challenge for Ocean Pacific

  

## Ocean Workers!

  

| | | |
|:-------------------------:|:-------------------------:|:-------------------------:|
| <img  width="250"  alt="GET ALL"  src="https://i.ibb.co/xsr15NM/GET.png"> GET::users/ | <img  width="250"  alt="GET ONE"  src="https://i.ibb.co/brR8cfs/GET-2.png"> GET::users/{id} |<img  width="280"  alt="POST"  src="https://i.ibb.co/gvnyC2S/POST.png"> POST::users |
| <img  width="250"  alt="DELETE"  src="https://i.ibb.co/gvnyC2S/DELETE.png"> DELETE::users/{id} | <img  width="250"  alt="PUT"  src="https://i.ibb.co/Qr6NQbp/PUT.png"> GET::users/{id} | Coming soon gif of the app |

  

## Installation

  

- All the `code` is required for run the app

- Need to have a `phone` with android version connected or an `Android Emulator`

  

### Clone

  

- Clone this repo to your local machine using `https://github.com/DarkMarksDoe/oceannet_app`

  

### Setup

  

> clone the repositor, and enter to folder

  

```shell

$ git clone https://github.com/DarkMarksDoe/oceannet_app.git

$ cd oceannet_app

```

  

> now update all the flutter packages

```shell

$ flutter pub get

```

> and now youre ready to run the app

```shell

$ flutter run

```

  

# Packages

For request location permissions and get latitude and longitude, i used the classic.

`geolocator` at version `6.1.13`.

<br><br><br>

In StateManagement, the easiest way (for me) is using Provider, provider was used only for update values of the list of pokes.

  

The Plugin is:

`provider`: at version `4.3.2+4`.

<br><br><br>

For consuming HTTP/HTTPS services, the best, the reliable old is `http`.

  

The plugin is:

`http`: at version `0.12.2`.

<br><br><br>

For create a nice view of DateTime, I use this package.

  

The plugin is: `intl` at version `0.16.1`.

<br><br><br>

We need to give some information to the user, for this we can use a lot of widget types, in this case, a way used in native android, "Toast", in flutter is called `Flutter Toast`.

  

The plugin is: `fluttertoast` at version `7.1.6`.
