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

    public class DispatchFeatures {

        public static final String ACCOUNT_INFO_PAGE = "accountInfoPage";
    }

    //Login - Logout - SignUp
    public class LoginFeatures {

        public static final String LOGIN_PAGE = "loginPage";
        public static final String PRODUCTS_PAGE = "productsPage";
        public static final String HOME_PAGE = "homePage";
        public static final String ADMIN_PAGE = "adminPage";
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
        public static final String PASSWORD_REGEX_ERR_MSG = "passwordRegexErrMsg";
        public static final String CONFIRM_NOTMATCH_ERR_MSG = "confirmNotMatchErrMsg";
        public static final String GIVENNAME_LENGTH_ERR_MSG = "givenNameLengthErrMsg";
        public static final String FAMILYNAME_LENGTH_ERR_MSG = "familyNameLengthErrMsg";
        public static final String PHONE_LENGTH_ERR_MSG = "phoneRegexErrMsg";
    }

    public class VerifyEmailFeatures {

        public static final String EMAIL_PAGE = "emailPage";
        public static final String VERIFY_PAGE = "verifyPage";
        public static final String LOGIN_PAGE = "loginPage";
        public static final String REGISTER_PAGE = "registerPage";
    }

    public class AdminFeatures {

        public static final String ADMIN_PAGE = "adminPage";
        public static final String USERACCOUNT_PAGE = "viewUsersPage";
        public static final String VIEW_PRODUCTS_PAGE = "viewProductsPage";
    }

    public class UsersFeatures {

        public static final String OLD_PASS_ERR_MESSAGE = "oldPasswordIncorrect";
        public static final String LOGIN_PAGE = "loginPage";
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
        public static final String CHECK_OUT_PAGE = "checkOutPage";
        public static final String CHECK_OUT_SUCCESS_PAGE = "checkOutSuccessPage";
    }

    public class Management {

        public static final String ORDER_MANAGEMENT_PAGE = "orderManagementPage";
        public static final String VIEW_ORDERDETAIL_PAGE = "orderDetailPage";
        public static final String PRODUCT_MANAGEMENT_PAGE = "productManagementPage";
        public static final String VIEW_PRODUCTDETAIL_PAGE = "productDetailPage";
        public static final String ADD_PRODUCT_PAGE = "addProductPage";

    }
}
