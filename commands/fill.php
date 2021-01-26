<?php

//TODO better date

require dirname(__DIR__) . '/vendor/autoload.php';

$faker = Faker\Factory::create();

$pdo = new PDO("mysql:host=localhost;dbname=web_scraping", 'root', '', [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8'
]);

$pdo->exec('SET FOREIGN_KEY_CHECKS = 0');
$pdo->exec('TRUNCATE TABLE ws_categories');
$pdo->exec('TRUNCATE TABLE ws_datas_type');
$pdo->exec('TRUNCATE TABLE ws_users');
$pdo->exec('TRUNCATE TABLE ws_scraps');
$pdo->exec('TRUNCATE TABLE ws_datas');
$pdo->exec('TRUNCATE TABLE ws_history');
$pdo->exec('SET FOREIGN_KEY_CHECKS = 1');

$cats = [];
$datatypes = [];
$users = [];
$scraps = [];

for ($i = 0; $i < 6; $i++) {
    $pdo->exec("INSERT INTO ws_categories SET c_title ='{$faker->sentence(2)}'");
    $cats[] = $pdo->lastInsertId();
}
for ($i = 0; $i < 6; $i++) {
    $pdo->exec("INSERT INTO ws_datas_type SET dt_name ='{$faker->sentence(2)}'");
    $datatypes[] = $pdo->lastInsertId();
}
$password = password_hash('admin', PASSWORD_BCRYPT);
for ($i = 0; $i < 6; $i++) {
    $pdo->exec("INSERT INTO ws_users SET u_first_name ='{$faker->firstName}', u_last_name ='{$faker->lastName}',
    u_phone ='{$faker->e164PhoneNumber}', u_email ='{$faker->email}', u_password ='$password', u_validate ='{$faker->numberBetween(0, 1)}'");
    $users[] = $pdo->lastInsertId();
}

foreach ($users as $user) {
    for ($i = 0; $i < 10; $i++) {
        $pdo->exec("INSERT INTO ws_scraps SET s_title ='{$faker->sentence(2)}', s_site ='{$faker->url}', s_periodicity ='{$faker->randomElement(array('daily', 'weekly', 'monthly'))}', s_date ='{$faker->date}', s_dataset ='{$faker->numberBetween(0, 1)}', s_user_id ='$user',s_category_id ='{$faker->randomElement($cats)}'");
        $scraps[] = $pdo->lastInsertId();
    }
}

foreach ($scraps as $scrap ) {
    $rand = $faker->numberBetween(1,3);
    $dataset = $faker->numberBetween(0, 1);

    $contenair = ($dataset==1)? $faker->sentence(3) : 'NULL';
    for ($i=0;$i<$rand;$i++){
        $path = $faker->sentence(3);
        $type = $faker->randomElement($datatypes);
        $pdo->exec("INSERT INTO ws_datas SET d_contenair ='$contenair', d_path_css ='$path', d_type_id =$type, d_scrap_id ='$scrap'");

        $json = json_encode(['contenair'=>$contenair,'path_css'=>$path,'type'=>$type]);
        $pdo->exec("INSERT INTO ws_history SET h_scrap_id=$scrap, h_date='{$faker->date}', h_data='$json'");
    }
    $scrapdataset = ($contenair=='NULL')? 0:1;
    $pdo->exec("UPDATE ws_scraps SET s_dataset=$scrapdataset WHERE s_id=$scrap");
}

