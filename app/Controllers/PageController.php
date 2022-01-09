<?php

    namespace App\Controllers;

    use App\Models\Page;

    class PageController extends BaseController
    {
        protected $page;

        public function __construct()
        {
            $this->page = new Page();
        }

        public function show($slug)
        {
            $page = $this->page->where('slug', $slug)->find();
            if (!$page) {
                return view('errors/html/error_404');
            }

            return view('pages/page', ['page' => $page[0]]);
        }
    }
