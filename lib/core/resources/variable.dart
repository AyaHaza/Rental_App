import 'package:google_sign_in/google_sign_in.dart';
import '../../features/authentication/view/profile.dart';
import '../../features/favorite/view/favourite.dart';
import '../../features/map/view/map.dart';
import '../../features/offer/view/offer.dart';
import '../../features/wallet/view/create_wallet.dart';


const String baseUrl = 'https://rideshare.devscape.online/api/v1';
const String registerApi = '/auth/register';
const String loginApi = '/auth/authenticate';
const String favourite_biclesApi = '/favourite-bicycles';
const String by_faourite_idApi= "by-favouriteId";
const String WalletInfo = '/wallet';
const String getAllvalidapi = '/All-valid-codes';
const String changePasswordApi="/users/change-password";
const String policyApi = '/policy';
const String contactusApi="https://nlulvjtzewkhpsistuhf.supabase.co/rest/v1/contact_us";
const String apiKey="apikey";
const String apikeySupa='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5sdWx2anR6ZXdraHBzaXN0dWhmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjQzMzY5MjAsImV4cCI6MjAzOTkxMjkyMH0.TsmIoIUBH3AQMC4cllXe0lBNJydLGH6xVwfM47OAq_Q';


final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
bool saveToken = false;
var user;
bool isGoogle = false;
int crrentIndex = 0;
final tabs = [
  MapScreen(),
  //!هون غلططط
 FavoriteScreen(bicycleId: 3,id: 1),
  const CreateWallet(),
  const OfferScreen(),
  const ProfileScreen()
];
