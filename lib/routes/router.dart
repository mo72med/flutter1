import 'package:flutter/material.dart';
import 'package:flutter1/Pages/favorites_page/favorites_list_page.dart';
import 'package:flutter1/routes/router_names.dart';

import '../Pages/CatalogsPages/Catalogs1Page.dart';
import '../Pages/CategoriesPages/categories2Page.dart';
import '../Pages/CategoriesPages/categoriesPage.dart';
import '../Pages/LoginPages/ForgotPage.dart';
import '../Pages/LoginPages/SignInPage.dart';
import '../Pages/LoginPages/SignUpPage.dart';
import '../Pages/Visual SearchPages/Crop the itemPage.dart';
import '../Pages/Visual SearchPages/FindingPage.dart';
import '../Pages/Visual SearchPages/Taking a photoPage.dart';
import '../Pages/Visual SearchPages/VisualSearchPage.dart';
import '../Pages/filters_page/filters_list_page.dart';
import '../Pages/filters_page/filters_page.dart';
import '../Pages/main_page/main_page.dart';
import '../Pages/my_bag_pages/add_shipping_address_page.dart';
import '../Pages/my_bag_pages/check_out_page.dart';
import '../Pages/my_bag_pages/my_bag_page.dart';
import '../Pages/my_bag_pages/payment_method.dart';
import '../Pages/my_bag_pages/shopping_address_page.dart';
import '../Pages/my_bag_pages/success_page.dart';
import '../Pages/product_card_pages/product_card_page.dart';
import '../Pages/profile_pages/my_order_page.dart';
import '../Pages/profile_pages/my_profile_page.dart';
import '../Pages/profile_pages/order_details_page.dart';
import '../Pages/profile_pages/setting_page.dart';
import '../Pages/rating_and_review_page/rating_and_review_page.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case signInPageRoute:
      return MaterialPageRoute(builder: (context) => const SignInPage());
    case signUpPageRoute:
      return MaterialPageRoute(
          builder: (context) => const SignupPage(), settings: settings);
    case forgotPageRoute:
      return MaterialPageRoute(
          builder: (context) => const ForgotPage(), settings: settings);
    case mainPageRoute:
      return MaterialPageRoute(
          builder: (context) => const MainPage(), settings: settings);
    case filtersListPageRoute:
      return MaterialPageRoute(
          builder: (context) => const FiltersListPage(), settings: settings);
    case filtersPageRoute:
      return MaterialPageRoute(
          builder: (context) => const FiltersPage(), settings: settings);
    case categories2PagesRoute:
      return MaterialPageRoute(
          builder: (context) => const Categories2Pages(), settings: settings);
    case categoriesPagesRoute:
      return MaterialPageRoute(
          builder: (context) => const CategoriesPages(), settings: settings);
    case catalogPageRoute:
      return MaterialPageRoute(
          builder: (context) => const CatalogPage(), settings: settings);
    case addShippingAddressPageRoute:
      return MaterialPageRoute(
          builder: (context) => const AddShippingAddressPage(),
          settings: settings);
    case checkOutPageRoute:
      return MaterialPageRoute(
          builder: (context) => const CheckOutPage(), settings: settings);
    case myBagPageRoute:
      return MaterialPageRoute(
          builder: (context) => const MyBagPage(), settings: settings);
    case paymentMethodPageRoute:
      return MaterialPageRoute(
          builder: (context) => const PaymentMethodPage(), settings: settings);
    case shoppingAddressPageRoute:
      return MaterialPageRoute(
          builder: (context) => const ShoppingAddressPage(),
          settings: settings);
    case successPageRoute:
      return MaterialPageRoute(
          builder: (context) => const SuccessPage(), settings: settings);
    case productCardPageRoute:
      return MaterialPageRoute(
          builder: (context) => const ProductCardPage(), settings: settings);
    case myOrderPageRoute:
      return MaterialPageRoute(
          builder: (context) => const MyOrderPage(), settings: settings);
    case myProfilePageRoute:
      return MaterialPageRoute(
          builder: (context) => const MyProfilePage(), settings: settings);
    case orderDetailsPageRoute:
      return MaterialPageRoute(
          builder: (context) => const OrderDetailsPage(), settings: settings);
    case settingPageRoute:
      return MaterialPageRoute(
          builder: (context) => const SettingPage(), settings: settings);
    case ratingAndReviewPageRoute:
      return MaterialPageRoute(
          builder: (context) => const RatingAndReviewPage(),
          settings: settings);
    case cropTheItemPageRoute:
      return MaterialPageRoute(
          builder: (context) => const CropTheItemPage(), settings: settings);
    case findingPageRoute:
      return MaterialPageRoute(
          builder: (context) => const FindingPage(), settings: settings);
    case takingPhotoPageRoute:
      return MaterialPageRoute(
          builder: (context) => const TakingPhotoPage(), settings: settings);
    case visualSearchPageRoute:
      return MaterialPageRoute(
          builder: (context) => const VisualSearchPage(), settings: settings);
    case favoritesListPageRoute:
      return MaterialPageRoute(
          builder: (context) => const FavoritesListPage(), settings: settings);

    default:
      return MaterialPageRoute(builder: (context) => const SignInPage());
  }
}
