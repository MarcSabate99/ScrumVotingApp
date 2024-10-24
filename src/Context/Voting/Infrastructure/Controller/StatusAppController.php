<?php

namespace App\Context\Voting\Infrastructure\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class StatusAppController extends AbstractController
{
    #[Route('/status', name: 'status')]
    public function test(): Response
    {
        return $this->json(['ok']);
    }
}