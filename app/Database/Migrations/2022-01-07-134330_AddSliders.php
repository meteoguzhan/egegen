<?php

    namespace App\Database\Migrations;
    use CodeIgniter\Database\Migration;

    class AddSliders extends Migration
    {
        public function up()
        {
            $this->forge->addField([
                'id' => [
                    'type' => 'INT',
                    'constraint' => 5,
                    'unsigned' => true,
                    'auto_increment' => true,
                ],
                'status' => [
                    'type' => 'ENUM',
                    'constraint' => ['1', '0'],
                    'default' => '1',
                ],
                'image' => [
                    'type' => 'TEXT',
                    'null' => false,
                ],
                'slug' => [
                    'type' => 'TEXT',
                    'null' => false,
                ],
                'updated_at' => [
                    'type' => 'datetime',
                    'null' => true,
                ],
                'created_at datetime default current_timestamp',
            ]);
            $this->forge->addPrimaryKey('id');
            $this->forge->createTable('sliders');
        }

        public function down()
        {
            //$this->forge->dropTable('sliders');
        }
    }