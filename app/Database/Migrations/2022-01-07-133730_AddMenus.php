<?php

    namespace App\Database\Migrations;

    use CodeIgniter\Database\Migration;

    class AddMenus extends Migration
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
                'parent_id' => [
                    'type' => 'INT',
                    'constraint' => 5,
                    'unsigned' => true,
                    'default' => 0,
                    'null' => false
                ],
                'status' => [
                    'type' => 'ENUM',
                    'constraint' => ['1', '0'],
                    'default' => '1',
                ],
                'name' => [
                    'type' => 'VARCHAR',
                    'constraint' => '100',
                    'null' => false
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
            $this->forge->createTable('menus');
        }

        public function down()
        {
            //$this->forge->dropTable('menus');
        }
    }