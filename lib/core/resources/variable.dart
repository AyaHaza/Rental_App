import 'package:google_sign_in/google_sign_in.dart';
import '../../features/authentication/view/profile.dart';
import '../../features/favorite/view/favorite.dart';
import '../../features/map/view/map.dart';
import '../../features/offer/view/offer.dart';
import '../../features/wallet/view/wallet.dart';

const String baseUrl='https://rideshare.devscape.online/api/v1';
const String registerApi='/auth/register';
const String loginApi='/auth/authenticate';
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