<?php

declare(strict_types=1);

namespace App\Http\Traits;

trait ApiTrait
{
    public function successResponse(string $message = "", int $statusCode = 200)
    {

        return response()->json([
            "success" => true,
            "message" => $message,
            "data" => (object)[],
            "errors" => (object)[]
        ],$statusCode);
    }
    public function errorResponse(array $errors = [], string $message = "", int $statusCode = 200)
    {

        return response()->json([
            "success" => false,
            "message" => $message,
            "data" => (object)[],
            "errors" => (object)$errors
        ],$statusCode);
    }
    public function data(array $data = [], string $message = "", int $statusCode = 200)
    {

        return response()->json([
            "success" => true,
            "message" => $message,
            "data" => (object)$data,
            "errors" => (object)[]
        ],$statusCode);
    }
}
