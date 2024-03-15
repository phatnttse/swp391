/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package phatntt.listener;

/**
 *
 * @author Admin
 */
import io.sentry.Sentry;
import io.sentry.SentryOptions;


public class SentryInitializer {

    public static void initializeSentry() {
        SentryOptions options = new SentryOptions();
        options.setDsn("https://1b02e17aeae3d85086ba719886c45de3@o4506899856031744.ingest.us.sentry.io/4506901504262144");

        // Set traces_sample_rate to 1.0 to capture 100%
        // of transactions for performance monitoring.
        // We recommend adjusting this value in production.
        options.setTracesSampleRate(1.0);

        Sentry.init(options);
    }
}

