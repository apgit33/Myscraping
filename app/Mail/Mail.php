<?php

namespace App\Mail;

use App\Models\User\User;

/**
 * Class Mail gérant l'envoi d'e-mail
 * @author Paturot A. <adrienpaturot@yahoo.fr>
 */
class Mail {

    /**
     * function d'envoi de mail avec le header pré-rempli
     *
     * @param string $mail    - Destinataire
     * @param string $sujet   - Sujet du mail
     * @param string $message - Message du mail
     * @return void
     */
    static function mailTo(User $user,$sujet,$message="test"){

        // Create the Transport
        $transport = (new \Swift_SmtpTransport(SMTP,PORT,SECURITY))
        ->setUsername(MAIL_USER_NAME)
        ->setPassword(MAIL_PASSWORD)
        ;

        // Create the Mailer using your created Transport
        $mailer = new \Swift_Mailer($transport);

        $body = "Bonjour ".$user->getFullName().",<br><br>";
        $body .= $message;
        // Create a message
        $message = (new \Swift_Message($sujet))
        ->setContentType("text/html")
        ->setFrom([MAIL => FIRST_NAME.LAST_NAME])
        ->setTo([$user->getEmail() => $user->getFullName()])
        ->setBody($body)
        ;

        // Send the message
        $mailer->send($message);
    }
}