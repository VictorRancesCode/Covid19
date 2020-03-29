from covid.apps.accounts.api.viewsets import AuthViewSet, LoggedUserViewSet
from covid.apps.core.api.viewsets import DepartamentViewSet, HospitalViewSet
from covid.apps.news.api.viewsets import NewsViewSet
from .router import Router

router = Router()

router.register("me", LoggedUserViewSet)
router.register("auth", AuthViewSet)
router.register("departament", DepartamentViewSet)
router.register("hospital", HospitalViewSet)
router.register("news", NewsViewSet)
urlpatterns = router.urls
