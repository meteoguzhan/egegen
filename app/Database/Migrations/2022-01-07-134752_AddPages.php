<?php

    namespace App\Database\Migrations;
    use CodeIgniter\Database\Migration;

    class AddPages extends Migration
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
                'title' => [
                    'type' => 'VARCHAR',
                    'constraint' => '255',
                    'null' => false
                ],
                'content' => [
                    'type' => 'TEXT',
                    'null' => false
                ],
                'slug' => [
                    'type' => 'TEXT',
                    'null' => false,
                ],
                'static_page' => [
                    'type' => 'TEXT',
                    'null' => true
                ],
                'updated_at' => [
                    'type' => 'datetime',
                    'null' => true,
                ],
                'created_at datetime default current_timestamp',
            ]);
            $this->forge->addPrimaryKey('id');
            $this->forge->createTable('pages');
        }

        public function down()
        {
            //$this->forge->dropTable('pages');
        }
    }