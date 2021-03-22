<?php

require_once('IyzipayBootstrap.php');

IyzipayBootstrap::init();

class Config
{
    public static function options()
    {
        $options = new \Iyzipay\Options();
        $options->setApiKey("sandbox-tD0qCvFNNAt6ghpT194xvwabtOT5PJiE");
        $options->setSecretKey("sandbox-63P5zgyN1U7k3G5VzsyyI6hB8UL0OAai");
        $options->setBaseUrl("https://sandbox-api.iyzipay.com");
        return $options;
    }
}