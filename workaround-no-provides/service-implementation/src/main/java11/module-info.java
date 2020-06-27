module workaround.service.implementation {
    exports tld.example.implementation;
    requires workaround.service.interfaces;
    requires org.apache.commons.lang3;
    requires org.slf4j;
}