import 'package:flutter_map/flutter_map.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../features/authentication/view/profile.dart';
import '../../features/favorite/view/favorite.dart';
import '../../features/map/view/map.dart';
import '../../features/offer/view/offer.dart';
import '../../features/wallet/view/wallet.dart';

const String baseUrl='https://rideshare.devscape.online/api/v1';
const String registerApi='/auth/register';
const String loginApi='/auth/authenticate';
const String getHubsApi='/hubs';
const String getBicycleCategoryApi='/bicycle/bicycles-categories';
const String getBicycleByCategoryApi='/bicycle/bicycles-by-category';
const String getHubContentApi='/hub-content/';
const String getBicycleDetailsApi='/bicycle/';
final String apiKey='5b3ce3597851110001cf624845116daa7faa4388a67f4709644835b7';
const String urlTempletMap="https://tile.openstreetmap.org/{z}/{x}/{y}.png";

final GoogleSignIn googleSignIn=GoogleSignIn(
    scopes: [
      'email'
    ]
);
bool saveToken=false;
var user;
bool isGoogle=false;
int crrentIndex=0;
final tabs=[
  MapScreen(),
  FavoriteScreen(),
  WalletScreen(),
  OfferScreen(),
  ProfileScreen()
];

List<Marker> marker=[];
int hubid=0;
double distance=0.0;