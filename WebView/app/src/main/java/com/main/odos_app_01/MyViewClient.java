package com.main.odos_app_01;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.webkit.WebResourceRequest;
import android.webkit.WebView;
import android.webkit.WebViewClient;

import java.net.URISyntaxException;

public class MyViewClient extends WebViewClient {

    @Override
    public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
        String url = request.getUrl().toString();
        if (!url.startsWith("http://") && !url.startsWith("https://") && !url.startsWith("javascript:")) {
            //외부 앱에 대한 URL scheme 대응
            Intent intent = null;

            try {

                intent = Intent.parseUri(url, Intent.URI_INTENT_SCHEME); //IntentURI처리
                Uri uri = Uri.parse(intent.getDataString());

                view.getContext().startActivity(new Intent(Intent.ACTION_VIEW, uri));
            } catch (URISyntaxException ex) {
                return false;
            } catch (ActivityNotFoundException e) {
                if ( intent == null )	return false;

                //설치되지 않은 앱에 대해 market이동 처리
                if ( handleNotFoundPaymentScheme(view.getContext(), intent.getScheme()) )	return true;

                //handleNotFoundPaymentScheme()에서 처리되지 않은 것 중, url로부터 package정보를 추출할 수 있는 경우 market이동 처리
                String packageName = intent.getPackage();
                if (packageName != null) {
                    view.getContext().startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse("market://details?id=" + packageName)));
                    return true;
                }

                return false;
            }
        }else {
            view.loadUrl(url);
        }
        return true;
    }

    /**
     * @param scheme
     * @return 해당 scheme에 대해 처리를 직접 하는지 여부
     * <p>
     * 결제를 위한 3rd-party 앱이 아직 설치되어있지 않아 ActivityNotFoundException이 발생하는 경우 처리합니다.
     * 여기서 handler되지않은 scheme에 대해서는 intent로부터 Package정보 추출이 가능하다면 다음에서 packageName으로 market이동합니다.
     */
    protected boolean handleNotFoundPaymentScheme(Context context, String scheme) {
        //PG사에서 호출하는 url에 package정보가 없어 ActivityNotFoundException이 난 후 market 실행이 안되는 경우
        if (PaymentScheme.ISP.equalsIgnoreCase(scheme)) {
            context.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse("market://details?id=" + PaymentScheme.PACKAGE_ISP)));
            return true;
        } else if (PaymentScheme.BANKPAY.equalsIgnoreCase(scheme)) {
            context.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse("market://details?id=" + PaymentScheme.PACKAGE_BANKPAY)));
            return true;
        } else if (PaymentScheme.HYUNDAI_APPCARD.equalsIgnoreCase(scheme)) {
            context.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse("market://details?id=" + PaymentScheme.PACKAGE_HYUNDAI)));
            return true;
        } else if (PaymentScheme.LOTTE_APPCARD.equalsIgnoreCase(scheme)) {
            context.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse("market://details?id=" + PaymentScheme.PACKAGE_LOTTE)));
            return true;
        } else if (PaymentScheme.SAMSUNG_APPCARD.equalsIgnoreCase(scheme)) {
            context.startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse("market://details?id=" + PaymentScheme.PACKAGE_SAMSUNG)));
            return true;
        }

        return false;
    }


    public class PaymentScheme {
        // intent가 아닌 특정 스키마로 시작하는 케이스 정리

        // 확인해 본 케이스는 ISP와 BANKPAY
        public final static String ISP = "ispmobile"; // ISP모바일 : ispmobile://TID=nictest00m01011606281506341724
        public final static String BANKPAY = "kftc-bankpay";

        public final static String LOTTE_APPCARD = "lotteappcard"; // 롯데앱카드 : intent://lottecard/data?acctid=120160628150229605882165497397&apptid=964241&IOS_RETURN_APP=#Intent;scheme=lotteappcard;package=com.lcacApp;end
        public final static String HYUNDAI_APPCARD = "hdcardappcardansimclick"; // 현대앱카드 : intent:hdcardappcardansimclick://appcard?acctid=201606281503270019917080296121#Intent;package=com.hyundaicard.appcard;end;
        public final static String SAMSUNG_APPCARD = "mpocket.online.ansimclick"; // 삼성앱카드 : intent://xid=4752902#Intent;scheme=mpocket.online.ansimclick;package=kr.co.samsungcard.mpocket;end;
        public final static String NH_APPCARD = "nhappcardansimclick"; // NH 앱카드 : intent://appcard?ACCTID=201606281507175365309074630161&P1=1532151#Intent;scheme=nhappcardansimclick;package=nh.smart.mobilecard;end;
        public final static String KB_APPCARD = "kb-acp"; // KB 앱카드 : intent://pay?srCode=0613325&kb-acp://#Intent;scheme=kb-acp;package=com.kbcard.cxh.appcard;end;
        public final static String MOBIPAY = "cloudpay"; // 하나(모비페이) : intent://?tid=2238606309025172#Intent;scheme=cloudpay;package=com.hanaskcard.paycla;end;

        public final static String PACKAGE_ISP = "kvp.jjy.MispAndroid320";
        public final static String PACKAGE_BANKPAY = "com.kftc.bankpay.android";
        public final static String PACKAGE_LOTTE = "com.lcacApp";
        public final static String PACKAGE_HYUNDAI = "com.hyundaicard.appcard";
        public final static String PACKAGE_SAMSUNG = "kr.co.samsungcard.mpocket";

    }

}
