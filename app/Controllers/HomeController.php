<?php

    namespace App\Controllers;

    use App\Models\DefaultSetting;
    use App\Models\News;
    use App\Models\Page;
    use App\Models\Slider;

    class HomeController extends BaseController
    {
        protected $new;
        protected $slider;
        protected $page;
        protected $defaultSetting;

        public function __construct()
        {
            $this->new = new News();
            $this->slider = new Slider();
            $this->page = new Page();
            $this->defaultSetting = new DefaultSetting();
            helper('string');
        }

        public function getNew($id)
        {
            $find = $this->new->find($id);
            if (!$find) {
                return $this->response->setJSON([
                    'status' => false,
                    'message' => 'Yeni haber bulunamadı!'
                ]);
            }


            $new = $this->new->nextNew($find['created_at']);
            if (!isset($new) || !$new) {
                return $this->response->setJSON([
                    'status' => false,
                    'message' => 'Yeni haber bulunamadı!'
                ]);
            }

            return $this->response->setJSON([
                'status' => true,
                'data' => [
                    'id' => $new[0]->id,
                    'title' => $new[0]->title,
                    'content' => text_limit($new[0]->content, 550),
                    'image' => $new[0]->image
                ]
            ]);
        }

        public function index()
        {
            return view('pages/home', [
                'new' => $this->new
                    ->orderBy('id', 'desc')
                    ->where('status', 1)
                    ->find($this->defaultSetting->where('enum', 'DEFAULT_NEW_ID')->first()['value']),
                'sliders' => $this->slider
                    ->where('status', 1)
                    ->findAll(),
                'page' => $this->page
                    ->where('status', 1)
                    ->find($this->defaultSetting->where('enum', 'DEFAULT_PAGE_ID')->first()['value'])
            ]);
        }
    }
