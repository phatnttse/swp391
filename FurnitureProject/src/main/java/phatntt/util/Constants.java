/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package phatntt.util;

/**
 *
 * @author Admin
 */
public class Constants {

    public class LoginFeatures {
  
        public static final String LOGIN_PAGE = "loginPage";
        public static final String PRODUCTS_PAGE = "productsPage";
        public static final String HOME_PAGE = "homePage";
        public static final String ADMIN_PAGE = "adminHomePage";
        public static final String HOME = "home";
        public static final String STAFF_PAGE = "dashboardPage";
        public static final String DASHBOARD = "dashboardPage";
        
    }

    public class LoginWithGoogleFeatures {

        public static final String GOOGLE_CLIENT_ID = "989469650876-pv3l59tm6f8ovljdpb0t7inem5qfsejl.apps.googleusercontent.com";

        public static final String GOOGLE_CLIENT_SECRET = "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";

        public static final String GOOGLE_REDIRECT_URI = "http://localhost:6969/FurnitureProject/loginWithGoogle";

        public static final String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";

        public static final String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";

        public static final String GOOGLE_GRANT_TYPE = "authorization_code";
    }

    public class LogoutFeatures {

        public static final String LOGIN_PAGE = "loginPage";

    }

    public class SignUpFeatures {

        public static final String REGISTER_PAGE = "registerPage";
        public static final String LOGIN_PAGE = "loginPage";
    }

    public class ValidateFeatures {

        public static final String PASSWORD_REGEX = "passwordRegex";
        public static final String PHONE_REGEX = "phoneRegex";
        public static final String PASSWORD_REGEX_ERR_MSG = "passwordRegexErrMsg";
        public static final String CONFIRM_NOTMATCH_ERR_MSG = "confirmNotMatchErrMsg";
        public static final String GIVENNAME_LENGTH_ERR_MSG = "givenNameLengthErrMsg";
        public static final String FAMILYNAME_LENGTH_ERR_MSG = "familyNameLengthErrMsg";
        public static final String PHONE_LENGTH_ERR_MSG = "phoneRegexErrMsg";
        public static final String OLD_PASS_ERR_MESSAGE = "oldPasswordIncorrect";
    }

    public class VerifyEmailFeatures {

        public static final String EMAIL_PAGE = "emailPage";
        public static final String VERIFY_PAGE = "verifyPage";
        public static final String LOGIN_PAGE = "loginPage";
        public static final String REGISTER_PAGE = "registerPage";
    }

    public class AdminFeatures {

        public static final String ADMIN_PAGE = "adminHomePage";
        public static final String USERACCOUNT_PAGE = "viewUsersPage";
        public static final String VIEW_DETAIL_ACCOUNT = "detailUserPage";
        public static final String CREATE_STAFF_ACCOUNT = "createStaffPage";
        public static final String LOGIN="loginAdminStaff";
    }

    public class OderFeatures {

        public static final String ORDER_PAGE = "orderPage";
        public static final String ORDER_DETAIL_PAGE = "orderDetailPage";
    }

    public class UsersFeatures {

        public static final String LOGIN_PAGE = "loginPage";
        public static final String EDIT_PROFILE_PAGE = "editProfilePage";
        public static final String CHANGE_PASSWORD_PAGE = "changePasswordPage";
        public static final String ACCOUNT_INFO_PAGE = "accountInfoPage";
        public static final String WISH_LIST_PAGE = "wishlistPage";
    }

    public class ProductsFeatures {

        public static final String SEARCH_PRODUCTS_PAGE = "searchProductsPage";
        public static final String HOME_PAGE = "homePage";
        public static final String PRODUCTS_PAGE = "productsPage";
        public static final String PRODUCTS_DETAIL = "productdetailPage";
    }

    public class ForgotPasswordFeatures {

        public static final String ENTER_EMAIL_PAGE = "enterEmailPage";
        public static final String FORGOT_EMAIL_PAGE = "fgPassEmailPage";
        public static final String CREATE_NEW_PASS = "createNewPasswordPage";
        public static final String LOGIN_PAGE = "loginPage";
        public static final String ENTER_VERIFICATION_CODE = "enterVerificationCodePage";
        public static final String PASSWORD_REGEX = "passwordRegex";
        public static final String CONFIRM_NOTMATCHED_ERR_MESSAGE = "confirmNotMatchedErrMessage";
    }

    public class ShoppingFeatures {

        public static final String CART_PAGE = "cartPage";
        public static final String PRODUCTS_PAGE = "productsPage";
        public static final String CREATE_ORDER_PAGE = "createOrderPage";
        public static final String ORDER_SUCCESS_PAGE = "orderSuccessPage";
        public static final String VNPAY_PAGE = "vnpayPage";
        public static final String CHECKOUT_SUCCESS_PAGE = "checkOutSuccessPage";

    }

    public class Management {

        public static final String ORDER_MANAGEMENT_PAGE = "orderManagerPage";
        public static final String VIEW_ORDERDETAIL_PAGE = "orderDetailManagerPage";
        public static final String REQUEST_TO_CANCEL_ORDER_PAGE = "requestToCancelOrderPage";

        public static final String PRODUCT_MANAGER_PAGE = "productManagerPage";
        public static final String VIEW_PRODUCT_DETAIL_PAGE = "productDetailManagerPage";
        public static final String ADD_PRODUCT_PAGE = "addProductPage";

        public static final String CATEGORY_MANAGER_PAGE = "categoryManagerPage";
        public static final String CATEGORY_DETAIL_PAGE = "categoryDetailManagerPage";
        public static final String ADD_NEW_CATEGORY_PAGE = "addCategoryPage";
              
    }
}
