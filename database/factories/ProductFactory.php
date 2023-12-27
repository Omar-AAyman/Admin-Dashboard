<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;


/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory <\App\Models\Model>
 */
class ProductFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'name_en' => fake()->name(),
            'name_ar' => fake()->name(),
            'desc_en' => fake()->name(),
            'desc_ar' => fake()->name(),
            'price' => fake()->numberBetween(100, 1000),
            'quantity' => fake()->numberBetween(10, 100),
            'code' => fake()->numberBetween(99999, 999999999),
            'status' => fake()->numberBetween(0, 1),
            'image' => Str::random(50),
            'sub_category_id' => fake()->numberBetween(10,100),
            'brand_id' => fake()->numberBetween(1,2),

        ];
    }
}
