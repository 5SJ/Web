package com.main.odos_app_01;

import androidx.core.app.ActivityCompat;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;

import android.Manifest;
import android.app.Activity;
import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Bundle;
import android.view.ViewTreeObserver;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.widget.Toast;

public class MainActivity extends Activity {

    WebView myWeb;
    SwipeRefreshLayout swiperefreshlayout;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        swiperefreshlayout = (SwipeRefreshLayout) findViewById(R.id.swiperefreshlayout);
        ActivityCompat.requestPermissions(
                this,
                new String[]{Manifest.permission.INTERNET},
                12
        );

        myWeb = (WebView)findViewById(R.id.myWeb);

        MyViewClient myViewClient = new MyViewClient();
        myWeb.setWebViewClient(myViewClient); // 웹뷰 내에서 링크이동(안하면 자꾸 휴대폰 브라우저 켜짐)

        WebSettings settings = myWeb.getSettings(); // 자바스크립트 허용하기
        settings.setJavaScriptEnabled(true);

        // 자기 ip 주소로 해야함, localhost 안댐, 확인법 : 윈도우+r -> cmd -> ipconfig -> IPv4 주소 확인
        myWeb.loadUrl("http://odos.o-r.kr");

        final Context myApp = this;
        myWeb.setWebChromeClient(new WebChromeClient() {
            @Override
            public boolean onJsAlert(WebView view, String url, String message, final android.webkit.JsResult result)
            {
                new AlertDialog.Builder(myApp)
                        .setTitle("AlertDialog")
                        .setMessage(message)
                        .setPositiveButton(android.R.string.ok,
                                new AlertDialog.OnClickListener()
                                {
                                    public void onClick(DialogInterface dialog, int which)
                                    {
                                        result.confirm();
                                    }
                                })
                        .setCancelable(false)
                        .create()
                        .show();
                return true;
            };
        });

        swiperefreshlayout.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener() {
            @Override
            public void onRefresh() {
                myWeb.reload();
                swiperefreshlayout.setRefreshing(false);
            }
        });
        swiperefreshlayout.getViewTreeObserver().addOnScrollChangedListener(new ViewTreeObserver.OnScrollChangedListener() {
            @Override
            public void onScrollChanged() {
                if(myWeb.getScrollY() == 0){
                    swiperefreshlayout.setEnabled(true);
                } else {
                    swiperefreshlayout.setEnabled(false);
                }
            }
        });

        Intent getIntent = getIntent();
        String url = getIntent.getStringExtra("url");

        if(url != null){
            myWeb.loadUrl(url);
        }
    }

    private long backBtnTime = 0;

    @Override
    public void onBackPressed() {
        long curTime = System.currentTimeMillis();
        long gapTime = curTime - backBtnTime;
        if (myWeb.canGoBack()) {
            if(myWeb.getOriginalUrl().equalsIgnoreCase("http://odos.o-r.kr/main/MainPage")){
                if (0 <= gapTime && 2000 >= gapTime) {
                    super.onBackPressed();
                    finishAffinity();
                    System.runFinalization();
                    System.exit(0);
                } else {
                    backBtnTime = curTime;
                    Toast.makeText(this, "한번 더 누르면 종료됩니다.", Toast.LENGTH_SHORT).show();
                }
            }else{
                myWeb.goBack();
            }
        }
    }
}