    <?php  
      
    // 获取设备标示  
    $deviceToken = '00544ff531cdabbe5f011d9b93c579b6842421c22be24ba3516b3162b5900aaf';  
      
    // 证书密码  
    $passphrase = 'ZHYU201314';  
      
    // 提示消息
    $message = 'My first push test!';  
      
    ////////////////////////////////////////////////////////////////////////////////  
      
    $ctx = stream_context_create();  
    stream_context_set_option($ctx, 'ssl', 'local_cert', 'ck.pem');  
    stream_context_set_option($ctx, 'ssl', 'passphrase', $passphrase);  
      
    // Open a connection to the APNS server  
    // 部署环境
     //$fp = stream_socket_client(?ssl://gateway.push.apple.com:2195?, $err, $errstr, 60, //STREAM_CLIENT_CONNECT, $ctx);  
    //测试环境
    $fp = stream_socket_client(  
    'ssl://gateway.sandbox.push.apple.com:2195', $err,  
    $errstr, 60, STREAM_CLIENT_CONNECT|STREAM_CLIENT_PERSISTENT, $ctx);  
      
    if (!$fp)  
    exit("Failed to connect: $err $errstr" . PHP_EOL);  
      
    echo 'Connected to APNS' . PHP_EOL;  
      
    // Create the payload body  
    $body['aps'] = array(  
    'alert' => $message,  
    'userId' => '7',  
    'sound' => 'default'  
    );  
      
    // Encode the payload as JSON  
    $payload = json_encode($body);  
      
    // Build the binary notification  
    $msg = chr(0) . pack('n', 32) . pack('H*', $deviceToken) . pack('n', strlen($payload)) . $payload;  
      
    // Send it to the server  
    $result = fwrite($fp, $msg, strlen($msg));  
      
    if (!$result)  
    echo 'Message not delivered' . PHP_EOL;  
    else  
    echo 'Message successfully delivered' . PHP_EOL;  
      
    // Close the connection to the server  
    fclose($fp);  
    ?>  