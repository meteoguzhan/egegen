<?php

    namespace App\Models;

    use CodeIgniter\Model;

    class News extends Model
    {
        protected $DBGroup = 'default';
        protected $table = 'news';
        protected $primaryKey = 'id';
        protected $useAutoIncrement = true;
        protected $insertID = 0;
        protected $returnType = 'array';
        protected $useSoftDeletes = false;
        protected $protectFields = true;
        protected $allowedFields = [
            'status',
            'title',
            'content',
            'image',
            'slug'
        ];

        // Dates
        protected $useTimestamps = false;
        protected $dateFormat = 'datetime';
        protected $createdField = 'created_at';
        protected $updatedField = 'updated_at';
        protected $deletedField = 'deleted_at';

        // Validation
        protected $validationRules = [];
        protected $validationMessages = [];
        protected $skipValidation = false;
        protected $cleanValidationRules = true;

        // Callbacks
        protected $allowCallbacks = true;
        protected $beforeInsert = [];
        protected $afterInsert = [];
        protected $beforeUpdate = [];
        protected $afterUpdate = [];
        protected $beforeFind = [];
        protected $afterFind = [];
        protected $beforeDelete = [];
        protected $afterDelete = [];

        function nextNew($date)
        {
            try {
                return $this->db->table('news')
                    ->select('id, title, content, image')
                    ->where('status', '1')
                    ->where('created_at >', $date)
                    ->orderBy('created_at', 'asc')
                    ->get(1)->getResult();
            } catch (\Exception $e) {
                return false;
            }
        }
    }
