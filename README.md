# j10i2_infra
j10i2 Infra repository
bastion_IP = 34.76.137.50
someinternalhost_IP = 10.132.0.3
testapp_IP = 35.205.86.211
testapp_port = 9292
gcloud compute instances create example-instance --metadata-from-file startup-script=/home/pavel/practise_git/j10i2_infra/startup_script.sh
gcloud compute firewall-rules create default-puma-server --action=ALLOW --allow=tcp:9292 --target-tags=puma_server


Терраформ успешно добавляет публичный ключ для appuser другим пользователям
При добавлении ключа через веб-интерфейс не удается указать что именно appuser_web будет назначен новый ключ
Добавлен балансировщик и count переменная


Homework 7 (Terraform module)
Созданы модули app, db, vpc.
Cозданы окружения stage, prod, с ограничением доступа к ssh по допустимым списком ip адресов указаным в source_ranges.
Каждое из окружений имеет удаленное хранение стейта в GCI.


Homework 8 (Ansible 1)

Будет заново склонирован репо, создав папку reddit


Homework 9 (Ansible 2)

1. Создан деплой приложения с помощью ansible. Рассмотрены 3 варианта: 1 плейбук 1 сценарий, 1 плейбук много сценариев, много плейбуков много сценариев.
2. Образы Пакер создаются с помощью Энсибл.
3. Задание со * рассмотрено в рамках предыдущего ДЗ.
