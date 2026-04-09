package com.selrom.db;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 *
 * @author Selrom Software
 */
public class disable_warnigs {

    @SuppressWarnings("unchecked")

    public static void disableAccessWarnings() {
        // On Java 17+, jdk.internal.module.IllegalAccessLogger was removed
        // and strong encapsulation is the default — no hack needed.
        try {
            Class.forName("jdk.internal.module.IllegalAccessLogger");
        } catch (ClassNotFoundException e) {
            // Java 17+ — class doesn't exist, nothing to disable
            return;
        }
        try {
            Class unsafeClass = Class.forName("sun.misc.Unsafe");
            Field field = unsafeClass.getDeclaredField("theUnsafe");
            field.setAccessible(true);
            Object unsafe = field.get(null);

            Method putObjectVolatile = unsafeClass.getDeclaredMethod("putObjectVolatile", Object.class, long.class,
                    Object.class);
            Method staticFieldOffset = unsafeClass.getDeclaredMethod("staticFieldOffset", Field.class);

            Class loggerClass = Class.forName("jdk.internal.module.IllegalAccessLogger");
            Field loggerField = loggerClass.getDeclaredField("logger");
            Long offset = (Long) staticFieldOffset.invoke(unsafe, loggerField);
            putObjectVolatile.invoke(unsafe, loggerClass, offset, null);
        } catch (ClassNotFoundException | IllegalAccessException | IllegalArgumentException | NoSuchFieldException
                | NoSuchMethodException | SecurityException | InvocationTargetException ignored) {
        }
    }

}
