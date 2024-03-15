/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package phatntt.util;

/**
 *
 * @author Dell
 */
import io.sentry.Sentry;
import io.sentry.SentryOptions;

public class SentryConfig {
    public static void configureSentry() {
        SentryOptions options = new SentryOptions();
        options.setDsn("https://9292644dc1740794bfe88e2257e2ec40@o4506900674052096.ingest.us.sentry.io/4506900678705152");
        Sentry.init(options);
    }
    
    
}

