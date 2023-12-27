<?php

namespace App\Http\Controllers\Dashboard;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class ProductController extends Controller
{
    public const Statuses =['Not Active', 'Active'];
    public function index()
    {

        $products = DB::table('products')->get();
        return view('products.index', compact('products'));
    }
    public function create()
    {
        $brands = DB::table('brands')->select('id','name_en','name_ar')->get();
        $sub_categories = DB::table('sub_categories')->select('id','name_en','name_ar')->get();

        return view('products.create',compact('brands', 'sub_categories'))->with('statuses', self::Statuses);
    }
}
