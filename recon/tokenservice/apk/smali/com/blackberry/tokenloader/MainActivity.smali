.class public Lcom/blackberry/tokenloader/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# instance fields
.field private listViewExistngToken:Landroid/widget/ListView;

.field private listViewExistngToken_adapter:Landroid/widget/ArrayAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/widget/ArrayAdapter",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mHandler:Landroid/os/Handler;

.field private progress:Landroid/app/ProgressDialog;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 43
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private GetTokens()Ljava/lang/String;
    .registers 30

    .prologue
    .line 163
    const/4 v14, 0x0

    .line 164
    .local v14, "is":Ljava/io/InputStream;
    const-string v3, ""

    .line 165
    .local v3, "bsn":Ljava/lang/String;
    const-string v18, ""

    .line 166
    .local v18, "message":Ljava/lang/String;
    const/4 v8, -0x1

    .line 167
    .local v8, "code":I
    const/4 v5, 0x0

    .line 168
    .local v5, "ca":Ljava/security/cert/Certificate;
    const/4 v10, 0x0

    .line 171
    .local v10, "context":Ljavax/net/ssl/SSLContext;
    invoke-direct/range {p0 .. p0}, Lcom/blackberry/tokenloader/MainActivity;->getBSN()Ljava/lang/String;

    move-result-object v3

    .line 172
    const-string v26, "TokenLoader"

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "BSN: "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v26

    if-eqz v26, :cond_2f

    .line 175
    const-string v26, "Unable to retrieve BSN"

    .line 276
    :goto_2e
    return-object v26

    .line 180
    :cond_2f
    :try_start_2f
    const-string v26, "X.509"

    invoke-static/range {v26 .. v26}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v6

    .line 181
    .local v6, "caFactory":Ljava/security/cert/CertificateFactory;
    invoke-virtual/range {p0 .. p0}, Lcom/blackberry/tokenloader/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v26

    const/high16 v27, 0x7f050000

    invoke-virtual/range {v26 .. v27}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_2f .. :try_end_3e} :catch_1cf

    move-result-object v7

    .line 183
    .local v7, "caInput":Ljava/io/InputStream;
    :try_start_3f
    invoke-virtual {v6, v7}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;
    :try_end_42
    .catchall {:try_start_3f .. :try_end_42} :catchall_1ca

    move-result-object v5

    .line 185
    :try_start_43
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V
    :try_end_46
    .catch Ljava/lang/Exception; {:try_start_43 .. :try_end_46} :catch_1cf

    .line 189
    :try_start_46
    invoke-static {}, Ljava/security/KeyStore;->getDefaultType()Ljava/lang/String;

    move-result-object v16

    .line 190
    .local v16, "keyStoreType":Ljava/lang/String;
    invoke-static/range {v16 .. v16}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v15

    .line 191
    .local v15, "keyStore":Ljava/security/KeyStore;
    const/16 v26, 0x0

    const/16 v27, 0x0

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    invoke-virtual {v15, v0, v1}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V

    .line 192
    const-string v26, "ca"

    move-object/from16 v0, v26

    invoke-virtual {v15, v0, v5}, Ljava/security/KeyStore;->setCertificateEntry(Ljava/lang/String;Ljava/security/cert/Certificate;)V

    .line 195
    invoke-static {}, Ljavax/net/ssl/TrustManagerFactory;->getDefaultAlgorithm()Ljava/lang/String;

    move-result-object v20

    .line 196
    .local v20, "tmfAlgorithm":Ljava/lang/String;
    invoke-static/range {v20 .. v20}, Ljavax/net/ssl/TrustManagerFactory;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/TrustManagerFactory;

    move-result-object v19

    .line 197
    .local v19, "tmf":Ljavax/net/ssl/TrustManagerFactory;
    move-object/from16 v0, v19

    invoke-virtual {v0, v15}, Ljavax/net/ssl/TrustManagerFactory;->init(Ljava/security/KeyStore;)V

    .line 200
    const-string v26, "TLS"

    invoke-static/range {v26 .. v26}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v10

    .line 201
    const/16 v26, 0x0

    invoke-virtual/range {v19 .. v19}, Ljavax/net/ssl/TrustManagerFactory;->getTrustManagers()[Ljavax/net/ssl/TrustManager;

    move-result-object v27

    const/16 v28, 0x0

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    move-object/from16 v2, v28

    invoke-virtual {v10, v0, v1, v2}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V
    :try_end_84
    .catch Ljava/lang/Exception; {:try_start_46 .. :try_end_84} :catch_1d9

    .line 209
    .end local v6    # "caFactory":Ljava/security/cert/CertificateFactory;
    .end local v7    # "caInput":Ljava/io/InputStream;
    .end local v15    # "keyStore":Ljava/security/KeyStore;
    .end local v16    # "keyStoreType":Ljava/lang/String;
    .end local v19    # "tmf":Ljavax/net/ssl/TrustManagerFactory;
    .end local v20    # "tmfAlgorithm":Ljava/lang/String;
    :goto_84
    :try_start_84
    new-instance v22, Ljava/net/URL;

    const-string v26, "https://stmtoken.services.blackberry.com/stmserver/ota/tokens?user=ota-request"

    move-object/from16 v0, v22

    move-object/from16 v1, v26

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 210
    .local v22, "url":Ljava/net/URL;
    invoke-virtual/range {v22 .. v22}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v9

    check-cast v9, Ljavax/net/ssl/HttpsURLConnection;

    .line 211
    .local v9, "conn":Ljavax/net/ssl/HttpsURLConnection;
    invoke-virtual {v10}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v26

    move-object/from16 v0, v26

    invoke-virtual {v9, v0}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 214
    sget-object v26, Lcom/blackberry/tokenloader/DisplayToken;->token_storage:Lcom/blackberry/tokenloader/TokenStorage;

    invoke-virtual/range {v26 .. v26}, Lcom/blackberry/tokenloader/TokenStorage;->ResetTokenNum()V

    .line 216
    const-string v26, "api_key"

    const-string v27, "l2t3DF611L1AfUjO295hMJjVVb7b72h9"

    move-object/from16 v0, v26

    move-object/from16 v1, v27

    invoke-virtual {v9, v0, v1}, Ljavax/net/ssl/HttpsURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 218
    const-string v26, "bsn"

    move-object/from16 v0, v26

    invoke-virtual {v9, v0, v3}, Ljavax/net/ssl/HttpsURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 219
    invoke-virtual {v9}, Ljavax/net/ssl/HttpsURLConnection;->connect()V

    .line 221
    invoke-virtual {v9}, Ljavax/net/ssl/HttpsURLConnection;->getResponseCode()I

    move-result v8

    .line 222
    const-string v26, "TokenLoader"

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "server response: "

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 223
    invoke-virtual {v9}, Ljavax/net/ssl/HttpsURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v14

    .line 226
    if-eqz v14, :cond_1ff

    .line 227
    new-instance v25, Ljava/util/zip/ZipInputStream;

    new-instance v26, Ljava/io/BufferedInputStream;

    move-object/from16 v0, v26

    invoke-direct {v0, v14}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct/range {v25 .. v26}, Ljava/util/zip/ZipInputStream;-><init>(Ljava/io/InputStream;)V

    .line 228
    .local v25, "zipinstream":Ljava/util/zip/ZipInputStream;
    const/16 v23, 0x0

    .line 230
    .local v23, "zipEntry":Ljava/util/zip/ZipEntry;
    :cond_ec
    :goto_ec
    invoke-virtual/range {v25 .. v25}, Ljava/util/zip/ZipInputStream;->getNextEntry()Ljava/util/zip/ZipEntry;

    move-result-object v23

    if-eqz v23, :cond_1f2

    .line 231
    const/16 v26, 0x600

    move/from16 v0, v26

    new-array v4, v0, [B

    .line 232
    .local v4, "buffer":[B
    const/16 v26, 0x600

    move/from16 v0, v26

    new-array v0, v0, [B

    move-object/from16 v21, v0

    .line 233
    .local v21, "token_buf":[B
    const/4 v11, 0x0

    .line 234
    .local v11, "count":I
    const/16 v17, 0x0

    .line 236
    .local v17, "ln":I
    :goto_103
    const/16 v26, 0x0

    const/16 v27, 0x600

    move-object/from16 v0, v25

    move/from16 v1, v26

    move/from16 v2, v27

    invoke-virtual {v0, v4, v1, v2}, Ljava/util/zip/ZipInputStream;->read([BII)I

    move-result v17

    const/16 v26, -0x1

    move/from16 v0, v17

    move/from16 v1, v26

    if-eq v0, v1, :cond_12b

    .line 238
    add-int v26, v11, v17

    const/16 v27, 0x600

    move/from16 v0, v26

    move/from16 v1, v27

    if-le v0, v1, :cond_1e3

    .line 239
    const/4 v11, -0x1

    .line 240
    const-string v26, "TokenLoader"

    const-string v27, "Token size exceeds the maximum support size."

    invoke-static/range {v26 .. v27}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 246
    :cond_12b
    const/16 v26, -0x1

    move/from16 v0, v26

    if-eq v11, v0, :cond_ec

    .line 247
    invoke-virtual/range {v23 .. v23}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    move-result-object v24

    .line 249
    .local v24, "zipEntryName":Ljava/lang/String;
    sget-object v26, Lcom/blackberry/tokenloader/DisplayToken;->token_storage:Lcom/blackberry/tokenloader/TokenStorage;

    move-object/from16 v0, v26

    move-object/from16 v1, v24

    move-object/from16 v2, v21

    invoke-virtual {v0, v1, v2, v11}, Lcom/blackberry/tokenloader/TokenStorage;->AddTokenRecord(Ljava/lang/String;[BI)V

    .line 250
    invoke-virtual/range {v25 .. v25}, Ljava/util/zip/ZipInputStream;->closeEntry()V

    .line 251
    const-string v26, "TokenLoader"

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "Token:"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-static {v11}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_167
    .catch Ljava/lang/Exception; {:try_start_84 .. :try_end_167} :catch_168

    goto :goto_ec

    .line 259
    .end local v4    # "buffer":[B
    .end local v9    # "conn":Ljavax/net/ssl/HttpsURLConnection;
    .end local v11    # "count":I
    .end local v17    # "ln":I
    .end local v21    # "token_buf":[B
    .end local v22    # "url":Ljava/net/URL;
    .end local v23    # "zipEntry":Ljava/util/zip/ZipEntry;
    .end local v24    # "zipEntryName":Ljava/lang/String;
    .end local v25    # "zipinstream":Ljava/util/zip/ZipInputStream;
    :catch_168
    move-exception v12

    .line 261
    .local v12, "e":Ljava/lang/Exception;
    :try_start_169
    const-string v26, "TokenLoader"

    const-string v27, "Exception to open connection"

    invoke-static/range {v26 .. v27}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 262
    invoke-virtual {v12}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v26

    invoke-virtual/range {v26 .. v26}, Ljava/lang/Throwable;->toString()Ljava/lang/String;
    :try_end_177
    .catch Ljava/lang/Exception; {:try_start_169 .. :try_end_177} :catch_203

    move-result-object v18

    .line 266
    :goto_178
    invoke-virtual {v12}, Ljava/lang/Exception;->printStackTrace()V

    .line 267
    const/16 v26, -0x1

    move/from16 v0, v26

    if-eq v8, v0, :cond_19d

    .line 268
    const-string v26, "TokenLoader"

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "Return Code"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v28

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 270
    :cond_19d
    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->isEmpty()Z

    move-result v26

    if-nez v26, :cond_1bf

    .line 271
    const-string v26, "TokenLoader"

    new-instance v27, Ljava/lang/StringBuilder;

    invoke-direct/range {v27 .. v27}, Ljava/lang/StringBuilder;-><init>()V

    const-string v28, "Error Message"

    invoke-virtual/range {v27 .. v28}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    move-object/from16 v0, v27

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v27

    invoke-virtual/range {v27 .. v27}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    invoke-static/range {v26 .. v27}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 274
    :cond_1bf
    const-string v26, "TokenLoader"

    const-string v27, "ErrorUnable to connect to server"

    invoke-static/range {v26 .. v27}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 276
    const-string v26, "Unable to connect to server"

    goto/16 :goto_2e

    .line 185
    .end local v12    # "e":Ljava/lang/Exception;
    .restart local v6    # "caFactory":Ljava/security/cert/CertificateFactory;
    .restart local v7    # "caInput":Ljava/io/InputStream;
    :catchall_1ca
    move-exception v26

    :try_start_1cb
    invoke-virtual {v7}, Ljava/io/InputStream;->close()V

    throw v26
    :try_end_1cf
    .catch Ljava/lang/Exception; {:try_start_1cb .. :try_end_1cf} :catch_1cf

    .line 205
    .end local v6    # "caFactory":Ljava/security/cert/CertificateFactory;
    .end local v7    # "caInput":Ljava/io/InputStream;
    :catch_1cf
    move-exception v12

    .line 206
    .restart local v12    # "e":Ljava/lang/Exception;
    :try_start_1d0
    const-string v26, "TokenLoader"

    const-string v27, "Failed to work with certificate factory"

    invoke-static/range {v26 .. v27}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1d7
    .catch Ljava/lang/Exception; {:try_start_1d0 .. :try_end_1d7} :catch_168

    goto/16 :goto_84

    .line 202
    .end local v12    # "e":Ljava/lang/Exception;
    .restart local v6    # "caFactory":Ljava/security/cert/CertificateFactory;
    .restart local v7    # "caInput":Ljava/io/InputStream;
    :catch_1d9
    move-exception v12

    .line 203
    .restart local v12    # "e":Ljava/lang/Exception;
    :try_start_1da
    const-string v26, "TokenLoader"

    const-string v27, "Failed to create SSL context certificate"

    invoke-static/range {v26 .. v27}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1e1
    .catch Ljava/lang/Exception; {:try_start_1da .. :try_end_1e1} :catch_1cf

    goto/16 :goto_84

    .line 243
    .end local v6    # "caFactory":Ljava/security/cert/CertificateFactory;
    .end local v7    # "caInput":Ljava/io/InputStream;
    .end local v12    # "e":Ljava/lang/Exception;
    .restart local v4    # "buffer":[B
    .restart local v9    # "conn":Ljavax/net/ssl/HttpsURLConnection;
    .restart local v11    # "count":I
    .restart local v17    # "ln":I
    .restart local v21    # "token_buf":[B
    .restart local v22    # "url":Ljava/net/URL;
    .restart local v23    # "zipEntry":Ljava/util/zip/ZipEntry;
    .restart local v25    # "zipinstream":Ljava/util/zip/ZipInputStream;
    :cond_1e3
    const/16 v26, 0x0

    :try_start_1e5
    move/from16 v0, v26

    move-object/from16 v1, v21

    move/from16 v2, v17

    invoke-static {v4, v0, v1, v11, v2}, Ljava/lang/System;->arraycopy([BI[BII)V

    .line 244
    add-int v11, v11, v17

    goto/16 :goto_103

    .line 254
    .end local v4    # "buffer":[B
    .end local v11    # "count":I
    .end local v17    # "ln":I
    .end local v21    # "token_buf":[B
    :cond_1f2
    invoke-virtual/range {v25 .. v25}, Ljava/util/zip/ZipInputStream;->close()V

    .line 255
    invoke-virtual {v14}, Ljava/io/InputStream;->close()V

    .line 256
    const-string v26, "TokenLoader"

    const-string v27, "Connection closed "

    invoke-static/range {v26 .. v27}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 258
    .end local v23    # "zipEntry":Ljava/util/zip/ZipEntry;
    .end local v25    # "zipinstream":Ljava/util/zip/ZipInputStream;
    :cond_1ff
    const-string v26, "Successful"
    :try_end_201
    .catch Ljava/lang/Exception; {:try_start_1e5 .. :try_end_201} :catch_168

    goto/16 :goto_2e

    .line 263
    .end local v9    # "conn":Ljavax/net/ssl/HttpsURLConnection;
    .end local v22    # "url":Ljava/net/URL;
    .restart local v12    # "e":Ljava/lang/Exception;
    :catch_203
    move-exception v13

    .line 264
    .local v13, "ei":Ljava/lang/Exception;
    invoke-virtual {v13}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_178
.end method

.method private LoadAndSelectTokens(Landroid/view/View;)Z
    .registers 7
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 123
    new-instance v1, Landroid/app/ProgressDialog;

    invoke-direct {v1, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/blackberry/tokenloader/MainActivity;->progress:Landroid/app/ProgressDialog;

    .line 124
    iget-object v1, p0, Lcom/blackberry/tokenloader/MainActivity;->progress:Landroid/app/ProgressDialog;

    const-string v2, "Contacting the server..."

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 125
    iget-object v1, p0, Lcom/blackberry/tokenloader/MainActivity;->progress:Landroid/app/ProgressDialog;

    invoke-virtual {v1, v3}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 126
    iget-object v1, p0, Lcom/blackberry/tokenloader/MainActivity;->progress:Landroid/app/ProgressDialog;

    invoke-virtual {v1, v4}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 127
    iget-object v1, p0, Lcom/blackberry/tokenloader/MainActivity;->progress:Landroid/app/ProgressDialog;

    invoke-virtual {v1, v3}, Landroid/app/ProgressDialog;->setProgress(I)V

    .line 128
    iget-object v1, p0, Lcom/blackberry/tokenloader/MainActivity;->progress:Landroid/app/ProgressDialog;

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->show()V

    .line 131
    new-instance v0, Lcom/blackberry/tokenloader/MainActivity$3;

    invoke-direct {v0, p0}, Lcom/blackberry/tokenloader/MainActivity$3;-><init>(Lcom/blackberry/tokenloader/MainActivity;)V

    .line 150
    .local v0, "worker_thread":Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 151
    return v4
.end method

.method private ShowAbout()V
    .registers 4

    .prologue
    .line 315
    new-instance v0, Landroid/app/Dialog;

    invoke-direct {v0, p0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    .line 316
    .local v0, "dialog":Landroid/app/Dialog;
    const/high16 v2, 0x7f040000

    invoke-virtual {v0, v2}, Landroid/app/Dialog;->setContentView(I)V

    .line 317
    const v2, 0x7f070001

    invoke-virtual {v0, v2}, Landroid/app/Dialog;->setTitle(I)V

    .line 319
    const v2, 0x7f0a0002

    invoke-virtual {v0, v2}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 321
    .local v1, "dialogButton":Landroid/widget/Button;
    new-instance v2, Lcom/blackberry/tokenloader/MainActivity$4;

    invoke-direct {v2, p0, v0}, Lcom/blackberry/tokenloader/MainActivity$4;-><init>(Lcom/blackberry/tokenloader/MainActivity;Landroid/app/Dialog;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 328
    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 329
    return-void
.end method

.method static synthetic access$000(Lcom/blackberry/tokenloader/MainActivity;Landroid/view/View;)Z
    .registers 3
    .param p0, "x0"    # Lcom/blackberry/tokenloader/MainActivity;
    .param p1, "x1"    # Landroid/view/View;

    .prologue
    .line 43
    invoke-direct {p0, p1}, Lcom/blackberry/tokenloader/MainActivity;->LoadAndSelectTokens(Landroid/view/View;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$100(Lcom/blackberry/tokenloader/MainActivity;)Ljava/lang/String;
    .registers 2
    .param p0, "x0"    # Lcom/blackberry/tokenloader/MainActivity;

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/blackberry/tokenloader/MainActivity;->GetTokens()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/blackberry/tokenloader/MainActivity;)Landroid/app/ProgressDialog;
    .registers 2
    .param p0, "x0"    # Lcom/blackberry/tokenloader/MainActivity;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/blackberry/tokenloader/MainActivity;->progress:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$300(Lcom/blackberry/tokenloader/MainActivity;)Landroid/os/Handler;
    .registers 2
    .param p0, "x0"    # Lcom/blackberry/tokenloader/MainActivity;

    .prologue
    .line 43
    iget-object v0, p0, Lcom/blackberry/tokenloader/MainActivity;->mHandler:Landroid/os/Handler;

    return-object v0
.end method

.method private getBSN()Ljava/lang/String;
    .registers 9

    .prologue
    .line 280
    const/4 v3, 0x0

    .line 282
    .local v3, "serial":Ljava/lang/String;
    :try_start_1
    const-string v4, "android.os.SystemProperties"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 283
    .local v1, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const-string v4, "get"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v7, Ljava/lang/String;

    aput-object v7, v5, v6

    invoke-virtual {v1, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 284
    .local v2, "get":Ljava/lang/reflect/Method;
    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v6, "ro.serialno"

    aput-object v6, v4, v5

    invoke-virtual {v2, v1, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    move-object v0, v4

    check-cast v0, Ljava/lang/String;

    move-object v3, v0
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_25} :catch_26

    .line 287
    .end local v1    # "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "get":Ljava/lang/reflect/Method;
    :goto_25
    return-object v3

    .line 285
    :catch_26
    move-exception v4

    goto :goto_25
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .registers 5
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 60
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 61
    new-instance v1, Lcom/blackberry/tokenloader/MainActivity$1;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/blackberry/tokenloader/MainActivity$1;-><init>(Lcom/blackberry/tokenloader/MainActivity;Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/blackberry/tokenloader/MainActivity;->mHandler:Landroid/os/Handler;

    .line 70
    const v1, 0x7f040001

    invoke-virtual {p0, v1}, Lcom/blackberry/tokenloader/MainActivity;->setContentView(I)V

    .line 72
    const v1, 0x7f0a0006

    invoke-virtual {p0, v1}, Lcom/blackberry/tokenloader/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 73
    .local v0, "buttonCre":Landroid/widget/Button;
    new-instance v1, Lcom/blackberry/tokenloader/MainActivity$2;

    invoke-direct {v1, p0}, Lcom/blackberry/tokenloader/MainActivity$2;-><init>(Lcom/blackberry/tokenloader/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 80
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .registers 4
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 293
    invoke-virtual {p0}, Lcom/blackberry/tokenloader/MainActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const/high16 v1, 0x7f090000

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 294
    const/4 v0, 0x1

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .registers 4
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 302
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 305
    .local v0, "id":I
    const v1, 0x7f0a000d

    if-ne v0, v1, :cond_e

    .line 306
    invoke-direct {p0}, Lcom/blackberry/tokenloader/MainActivity;->ShowAbout()V

    .line 307
    const/4 v1, 0x1

    .line 310
    :goto_d
    return v1

    :cond_e
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    goto :goto_d
.end method

.method protected onResume()V
    .registers 13

    .prologue
    const/4 v11, 0x1

    .line 84
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 86
    new-instance v7, Lcom/blackberry/tokenloader/TokenStorage;

    invoke-direct {v7}, Lcom/blackberry/tokenloader/TokenStorage;-><init>()V

    .line 88
    .local v7, "token_storage_names":Lcom/blackberry/tokenloader/TokenStorage;
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 91
    .local v5, "token_name_list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {v7}, Lcom/blackberry/tokenloader/TokenStorage;->GetTokenList()Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    .line 92
    .local v3, "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const-string v8, "TokenService"

    invoke-static {v8}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v8

    invoke-static {v8}, Lcom/blackberry/tokenservice/ITokenService$Stub;->asInterface(Landroid/os/IBinder;)Lcom/blackberry/tokenservice/ITokenService;

    move-result-object v4

    .line 94
    .local v4, "om":Lcom/blackberry/tokenservice/ITokenService;
    const/4 v6, 0x0

    .line 95
    .local v6, "token_present":I
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_25
    :goto_25
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_82

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 97
    .local v2, "key":Ljava/lang/String;
    :try_start_31
    invoke-interface {v4, v2}, Lcom/blackberry/tokenservice/ITokenService;->isTokenPresent(Ljava/lang/String;)I
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_31 .. :try_end_34} :catch_61

    move-result v6

    .line 102
    :goto_35
    const-string v8, "TokenLoader"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Key: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "  "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-static {v6}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    if-ne v6, v11, :cond_25

    invoke-interface {v5, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_25

    .line 98
    :catch_61
    move-exception v0

    .line 99
    .local v0, "e":Ljava/lang/Exception;
    const-string v8, "TokenLoader"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "FAILED to call service(read). Exception: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_35

    .line 105
    .end local v0    # "e":Ljava/lang/Exception;
    .end local v2    # "key":Ljava/lang/String;
    :cond_82
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v8

    if-lez v8, :cond_b0

    .line 107
    const v8, 0x7f0a0005

    invoke-virtual {p0, v8}, Lcom/blackberry/tokenloader/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/ListView;

    iput-object v8, p0, Lcom/blackberry/tokenloader/MainActivity;->listViewExistngToken:Landroid/widget/ListView;

    .line 108
    iget-object v8, p0, Lcom/blackberry/tokenloader/MainActivity;->listViewExistngToken:Landroid/widget/ListView;

    const/high16 v9, 0x3000000

    invoke-virtual {v8, v9}, Landroid/widget/ListView;->setScrollBarStyle(I)V

    .line 109
    iget-object v8, p0, Lcom/blackberry/tokenloader/MainActivity;->listViewExistngToken:Landroid/widget/ListView;

    invoke-virtual {v8, v11}, Landroid/widget/ListView;->setFastScrollAlwaysVisible(Z)V

    .line 111
    new-instance v8, Landroid/widget/ArrayAdapter;

    const v9, 0x1090003

    invoke-direct {v8, p0, v9, v5}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    iput-object v8, p0, Lcom/blackberry/tokenloader/MainActivity;->listViewExistngToken_adapter:Landroid/widget/ArrayAdapter;

    .line 114
    iget-object v8, p0, Lcom/blackberry/tokenloader/MainActivity;->listViewExistngToken:Landroid/widget/ListView;

    iget-object v9, p0, Lcom/blackberry/tokenloader/MainActivity;->listViewExistngToken_adapter:Landroid/widget/ArrayAdapter;

    invoke-virtual {v8, v9}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 116
    :cond_b0
    return-void
.end method

.method public onStart()V
    .registers 1

    .prologue
    .line 334
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 335
    return-void
.end method

.method public onStop()V
    .registers 1

    .prologue
    .line 339
    invoke-super {p0}, Landroid/app/Activity;->onStop()V

    .line 341
    return-void
.end method
