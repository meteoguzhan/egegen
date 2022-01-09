<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class AddDefaultSetting extends Migration
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
            'enum' => [
                'type' => 'TEXT',
                'null' => false
            ],
            'value' => [
                'type' => 'TEXT',
                'null' => false
            ],
        ]);
        $this->forge->addPrimaryKey('id');
        $this->forge->createTable('default_settings');
    }

    public function down()
    {
        //$this->forge->dropTable('default_setting');
    }
}
