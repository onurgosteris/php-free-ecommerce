<?php

require_once('IyzipayBootstrap.php');

IyzipayBootstrap::init();

class Config
{
    public static function options()
    {
        $options = new \Iyzipay\Options();
        $options->setApiKey("APİKEY");
        $options->setSecretKey("APİSECRET");
        $options->setBaseUrl("https://sandbox-api.iyzipay.com(BU SANDBOX İÇİN)");
        return $options;
    }
}
